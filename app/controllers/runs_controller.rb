require 'strava/api/v3'

class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :set_strava_client, only: [:strava_index, :new]


  def index
    @runs = Run.all
  end

  def strava_index
    @activites ||= @client.list_athlete_activities.map {|act| StravaUtils.new(act)}
  end

  def show
  end

  def new
    activity ||= StravaUtils.new(@client.retrieve_an_activity(params['activity_id']))
    if params['activity_id']
      @run = Run.new(activity_id: activity.id,
                     name: activity.name,
                     miles: activity.miles,
                     finish: activity.elapsed_time,
                     date: activity.date)
    else
      @run = Run.new
    end

  end

  def edit
  end

  def create
    @run = Run.new(run_params)
    if @run.save
      CreateDatum.new(@run).execute
      redirect_to @run, notice: 'Run was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    datum = Datum.find_entry(@run)
    Run.transaction do
      @run.destroy
      datum.destroy
    end
    redirect_to runs_url, notice: 'Run was successfully destroyed.'
  end

  private

  def set_run
    @run = Run.find(params[:id])
  end

  def set_strava_client
    @client ||= Strava::Api::V3::Client.new(access_token: ENV['STRAVATOKEN'])
  end

  def run_params
    params.require(:run).permit(:name, :race, :miles, :finish, :pace, :description, :strava, :date, :activity_id)
  end

end

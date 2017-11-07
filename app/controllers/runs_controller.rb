require 'strava/api/v3'

class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :set_strava_client, only: [:strava_index, :new]


  def index
    @runs = Run.all
  end

  def strava_index
  end

  def show
  end

  def new
    activity ||= @client.retrieve_an_activity(params['activity_id'])
    if params['activity_id']
      @run = Run.new(
          activity_id: params[:activity_id],
          name: activity['name'],
          miles: activity['distance'],
          finish: activity['elapsed_time'],
          date: activity['start_date_local']
      )
    else
      @run = Run.new
    end

  end

  def edit
  end

  def create
    @run = Run.new(run_params)
    if @run.save
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
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
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

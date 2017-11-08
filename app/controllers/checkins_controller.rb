class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]
  before_action :set_swarm_client, only: [:swarm_index, :new]
  before_action :admin_required

  def swarm_index
    @checkins = @client.checkins
  end

  def index
    @checkins = Checkin.all
  end

  def new
    checkin ||= @client.checkin(params['swarm_id'])
    if params['swarm_id']
      @checkin = Checkin.new(swarm_id: checkin.id,
                     name: checkin.name,
                     category: checkin.category,
                     address: checkin.address,
                     city: checkin.city,
                     date: checkin.created_at,
                     payload: checkin.json)
    else
      @checkin = Checkin.new
    end

  end

  def create
    @checkin = Checkin.new(checkin_params)
    if @checkin.save
      CreateDatum.new(@checkin).execute
      redirect_to @checkin, notice: 'Checkin was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    datum = Datum.find_entry(@checkin)
    Checkin.transaction do
      @checkin.destroy
      datum.destroy
    end
    redirect_to checkins_url, notice: 'Checkin was successfully destroyed.'
  end

  private

  def set_checkin
    @checkin = Checkin.find(params[:id])
  end

  def checkin_params
    params.require(:checkin).permit(:name, :date, :category, :payload, :address, :city, :swarm_id)
  end

  def set_swarm_client
    @client ||= Foursquare.new(oauth_token: ENV['FSTOKEN'], v: '20170505')
  end

end
class CheckinsController < ApplicationController

  def swarm_index
    client = Foursquare.new(oauth_token: ENV['FSTOKEN'], v: '20170505')
    @checkins = client.checkins
  end

  def index

  end

  def new
    @checkin = Checkin.new
  end

  def create

  end

  def show

  end

end
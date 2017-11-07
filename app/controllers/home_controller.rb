class HomeController < ApplicationController

  def index
    @runs = Run.all
    @checkins = Checkin.all
  end

  def add

  end

end
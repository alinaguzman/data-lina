class DataController < ApplicationController

  def index
    @data = Datum.all.order('date DESC')
  end

end
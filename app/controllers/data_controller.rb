class DataController < ApplicationController
  before_action :admin_required

  def index
    @data = Datum.all.order('date DESC')
  end

end
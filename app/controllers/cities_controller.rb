class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :admin_required

  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    if @city.save
      CreateDatum.new(@city).execute
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    datum = Datum.find_entry(@city)
    City.transaction do
      @city.destroy
      datum.destroy
    end
    redirect_to runs_url, notice: 'City was successfully destroyed.'
  end

  private
  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :purpose, :state, :country, :date)
  end
end

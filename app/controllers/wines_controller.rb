class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :admin_required

  def index
    @wines = Wine.all
  end

  def show
  end

  def new
    @wine = Wine.new
  end

  def edit
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      CreateDatum.new(@wine).execute
      redirect_to @wine, notice: 'Wine was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    datum = Datum.find_entry(@wine)
    Wine.transaction do
      @wine.destroy
      datum.destroy
    end
    redirect_to runs_url, notice: 'Wine was successfully destroyed.'
  end

  private
  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:grapes, :winery, :year, :region, :rating, :description, :date, :purchased, :location)
  end
end

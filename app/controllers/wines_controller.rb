class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
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
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_wine
      @wine = Wine.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:varietal, :year, :region, :rating, :description, :date, :purchased, :location)
    end
end

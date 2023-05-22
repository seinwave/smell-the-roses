class PlantStatusesController < ApplicationController
  def index
      @plant_statuses = PlantStatus.all
  end

  def show
      @plant_status = PlantStatus.find(params[:id])
  end

  def new
    @article = Article.new
  end 

  def create
      @plant_status = PlantStatus.new(plant_status_params)
      if @plant_status.save
        redirect_to @plant_status
      else 
        render @plant_status.errors, status: :unprocessable_entity
      end 
  end

  private
  def plant_status_params
      params.require(:plant_status).permit(:status, :plant_id)
  end

end

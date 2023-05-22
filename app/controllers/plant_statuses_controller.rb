class PlantStatusesController < ApplicationController
  def index
      @plant_statuses = PlantStatus.all
  end

  def show
      @plant_status = PlantStatus.find(params[:id])
  end
  
end

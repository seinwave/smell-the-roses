class PlantStatusesController < ApplicationController
  def index
      @plant_statuses = PlantStatus.all
  end
end

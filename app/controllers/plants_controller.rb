# frozen_string_literal: true

class PlantsController < ApiController
  def index
    @plants = Plant.all
    @cultivars = Cultivar.all
    @cultivargroups = CultivarGroup.all
    render json: @plants
  end

  def show
    @plant = Plant.find(params[:id])
    render json: @plant 
  end 
end

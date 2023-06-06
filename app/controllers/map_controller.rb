class MapController < ApplicationController

    @plants = Plant.all
    render json: @plants
end

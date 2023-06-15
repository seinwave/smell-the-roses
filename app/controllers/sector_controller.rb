class SectorController < ApplicationController
    def index
        @sectors = Sector.all
    end

    def show
        @sector = Sector.find(params[:id])
    end
end

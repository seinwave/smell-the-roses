# frozen_string_literal: true

class CultivarColorsController < ApplicationController
  def index
    @cultivar_colors = CultivarColor.all
  end

def show
  puts 'CultivarColorsController#show'
  @cultivar_color = CultivarColor.find(params[:id])
  @cultivar = Cultivar.find(@cultivar_color.cultivar_id)
  @primary_color = @cultivar_color.primary_color
  @accent_color = @cultivar_color.primary_color
end

  
end

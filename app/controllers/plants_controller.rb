# frozen_string_literal: true

class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    @cultivars = Cultivar.all
    @cultivargroups = CultivarGroup.all
    @cultivar_colors = CultivarColor.all
  end
end

require 'rails_helper'

RSpec.describe PlantStatus, type: :model do
  it 'should not save a status without a status entry' do
    status = PlantStatus.new
    expect(status.save).to eq(false)
  end

  it 'should not save a status without a plant_id' do
    status = PlantStatus.new
    status.status = 0
    expect(status.save).to eq(false)
  end 

  it 'should save, with a status and plant_id' do
    status = PlantStatus.new
    status.status = 0
    status.plant_id = 1

    puts "PLANT:",  Plant.find(1)
    expect(status.save).to eq(true)
  end
end

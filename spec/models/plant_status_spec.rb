require 'rails_helper'

RSpec.describe PlantStatus, type: :model do
  it 'should not save a status without a status entry' do
    status = PlantStatus.new
    expect(status.save).to eq(false)
  end
end

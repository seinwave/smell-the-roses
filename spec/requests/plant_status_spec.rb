require 'rails_helper'

RSpec.describe "PlantStatuses", type: :request do
  it 'should show a specific status' do 
    status = PlantStatus.new
    status.status = 0
    status.plant_id = 1
    status.save
    expect(status.save).to eq(true)
    url = "URL TO VISIT", "/plant_statuses/#{status.id}"
    get "/plant_statuses/#{status.id}"
    expect(response).to have_http_status(:success)
    expect(response.body).to include("peak")
  end
end

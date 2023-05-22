require 'rails_helper'

RSpec.describe "PlantStatuses", type: :request do

  
  describe "GET /plant_statuses" do
    it 'should show all statuses' do
      get "/plant_statuses"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("PLANT STATUSES")
    end
    
    it 'should show a specific status' do 
      status = PlantStatus.new
      status.status = 0
      status.plant_id = 1
      status.save
      expect(status.save).to eq(true)
      get "/plant_statuses/#{status.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("peak")
    end
  end 

  describe "POST /plant_statuses" do
    it 'should create a new status, with valid parameters' do
    parameters = { plant_status:{status: 'peak', plant_id: 1} }
    post "/plant_statuses", params: parameters
    expect(response).to have_http_status(:redirect)
    expect(PlantStatus.count).to eq(1)
    expect(PlantStatus.last.status).to eq("peak")
  end

    it 'should redirect to an error page, with invalid parameters' do
    parameters = { status: 'peak' }
    post "/plant_statuses", params: parameters
    puts response 
    expect(response).to have_http_status(:failure)
   
  end
end

  # it 'should update a selected status' do
  #   parameters = { status_id: 1, status: 'budding' }
  #   post "/plant_statuses", params: parameters
  #   expect(response).to have_http_status(:redirect)
  #   expect(PlantStatus.count).to eq(1)
  #   expect(PlantStatus.last.status).to eq("peak")
  # end


end

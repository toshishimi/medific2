require 'rails_helper'

RSpec.describe "DateHospitals", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/date_hospitals/index"
      expect(response).to have_http_status(:success)
    end
  end

end

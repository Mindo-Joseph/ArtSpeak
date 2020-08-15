require 'rails_helper'

RSpec.describe "Artworks", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/artwork/index"
      expect(response).to have_http_status(:success)
    end
  end

end

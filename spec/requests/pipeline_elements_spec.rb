require 'rails_helper'

RSpec.describe "PipelineElements", type: :request do
  describe "GET /pipeline_elements" do
    it "returns http success" do
      get "/pipeline_elements"
      expect(response).to have_http_status(:success)
    end
  end
end

require 'rails_helper'

RSpec.describe "Prompts", :type => :request do
  describe "GET /prompts" do
    it "works! (now write some real specs)" do
      get prompts_path
      expect(response).to have_http_status(200)
    end
  end
end

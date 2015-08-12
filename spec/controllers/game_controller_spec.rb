require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  include Devise::TestHelpers

  before (:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in :admin
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      p response
      expect(response.status).to eq(200)
    end
  end
end


require 'rails_helper'

RSpec.describe "HabitDays", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/habit_days/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/habit_days/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/habit_days/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/habit_days/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/habit_days/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end

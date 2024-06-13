require 'rails_helper'

RSpec.describe "Habit", type: :request do
  let!(:user) { create(:user, confirmed_at: Time.now) }

  before do
    sign_in user
  end

  describe "GET /habits/" do
    it "returns http found" do
      get "/habits"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /habits/progress/" do
    it "returns http found" do
      get "/habits/progress"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /habits/" do
    it "returns http found" do
      post "/habits", { params: { habit: { name: 'habit' } } }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PUT /habits/:id/" do
    let!(:habit) { create(:habit, user: user) }

    it "returns http found" do
      put "/habits/#{habit.id}", { params: { habit: { name: 'habit' } } }
      expect(response).to have_http_status(:found)
    end
  end


  describe "DELETE /habits/:id/" do
    let!(:habit) { create(:habit, user: user) }

    it "returns http found" do
      delete "/habits/#{habit.id}"
      expect(response).to have_http_status(:found)
    end
  end
end

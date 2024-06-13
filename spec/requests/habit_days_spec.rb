require 'rails_helper'

RSpec.describe "HabitDays", type: :request do
  let!(:user) { create(:user, confirmed_at: Time.now) }
  let!(:habit) { create(:habit, user: user) }

  before do
    sign_in user
  end

  describe "POST /habit_days/" do
    it "returns http found" do
      post "/habit_days", { params: { habit_day: { habit_id: habit.id, date: Time.now } } }
      expect(response).to have_http_status(:found)
    end
  end

  describe "PUT /habit_days/:id/" do
    let(:habit_day) { create(:habit_day, habit: habit) }

    it "returns http found" do
      put "/habit_days/#{habit_day.id}"
      expect(response).to have_http_status(:found)
    end
  end


  describe "DELETE /habit_days/:id/" do
    let(:habit_day) { create(:habit_day, habit: habit) }

    it "returns http found" do
      delete "/habit_days/#{habit_day.id}"
      expect(response).to have_http_status(:found)
    end
  end
end

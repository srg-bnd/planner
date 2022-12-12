# frozen_string_literal: true

class UsersSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
end

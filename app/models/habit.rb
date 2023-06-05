# frozen_string_literal: true

class Habit < ApplicationRecord
  has_many :habits
  belongs_to :user
end

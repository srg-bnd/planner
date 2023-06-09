# frozen_string_literal: true

class HabitDay < ApplicationRecord
  belongs_to :habit

  before_create do
    self.draft = true
  end
end

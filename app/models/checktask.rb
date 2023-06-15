# frozen_string_literal: true

class Checktask < ApplicationRecord
  belongs_to :user

  scope :done, -> { where(done: true) }
  scope :doing, -> { where(done: false) }

  before_create do
    self.done = false
  end
end

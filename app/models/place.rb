# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :title
end

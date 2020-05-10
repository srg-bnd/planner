class Place < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :title
end

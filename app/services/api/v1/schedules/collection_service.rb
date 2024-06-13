# frozen_string_literal: true

module API
  module V1
    module Schedules
      class CollectionService < BaseService
        def call(current_user)
          list = current_user.schedules
          list = filter(list)
          sort(list)
        end

        private

        def filter(list)
          list
        end

        def sort(list)
          list.order(created_at: :asc)
        end
      end
    end
  end
end

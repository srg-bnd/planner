# frozen_string_literal: true

module API
  module V1
    class SchedulesController < BaseController
      def index
        @schedules = SchedulesQuery.call(current_user)
      end
    end
  end
end

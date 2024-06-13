# frozen_string_literal: true

module API
  module V1
    class BaseController < ApplicationController
      # Skipping CSRF token checking in API
      layout 'application.json'
      skip_before_action :verify_authenticity_token
    end
  end
end

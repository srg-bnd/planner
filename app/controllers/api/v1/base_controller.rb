# frozen_string_literal: true

# Base controller
class Api::V1::BaseController < ApplicationController
  # Skipping CSRF token checking in API
  layout 'application.json'
  skip_before_action :verify_authenticity_token
end

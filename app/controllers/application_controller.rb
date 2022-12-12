# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ActiveFinder

  add_flash_types :primary, :secondary, :success, :danger,
                  :warning, :info, :light, :dark
  around_action :switch_locale
end

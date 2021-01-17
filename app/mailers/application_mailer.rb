# frozen_string_literal: true

# Base mailer
class ApplicationMailer < ActionMailer::Base
  default from: ENV['RAILS_DEFAULT_EMAIL']

  layout 'mailer'
end

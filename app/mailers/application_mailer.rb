# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['RAILS_DEFAULT_EMAIL']

  layout 'mailer'
end

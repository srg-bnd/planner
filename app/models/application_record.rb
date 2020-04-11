class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.gen_secret_token 
    SecureRandom.urlsafe_base64(nil, false)
  end
end

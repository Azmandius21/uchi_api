class Student < ApplicationRecord
  belongs_to :school
  belongs_to :klass

  def generate_auth_token
    Digest::SHA256.hexdigest("#{self.id}#{ Rails.application.secrets.secret_key_base}")
  end
end

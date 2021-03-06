module Toqui
  class Password < ApplicationRecord
    self.table_name = "toqui_passwords"

    belongs_to :user, class_name: Toqui.user_class.to_s
    has_secure_password

    def matches candidate
      bcrypt_password = BCrypt::Password.new password_digest
      bcrypt_password == candidate
    end
  end
end

module Toqui
  class Session < ApplicationRecord
    belongs_to :user, class_name: Toqui.user_class.to_s

    before_validation :set_user

    private

    def set_user
      self.user = Toqui.user_class.find user_id
    end
  end
end

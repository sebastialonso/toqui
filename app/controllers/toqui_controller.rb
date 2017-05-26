module Toqui
  class ToquiController < ApplicationController
    protect_from_forgery with: :exception

    private

    def just_before_registration
      puts "Running just before_registrations "
    end

    def just_after_registration
      puts "Running just_after_registration"
    end

    def redirect_after_registration
      redirect_to root_path
    end
  end
end

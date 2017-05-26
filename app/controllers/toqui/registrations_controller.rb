require_dependency "toqui_controller"

module Toqui
  class RegistrationsController < ToquiController
    include RegistrationsHelper

    def new
      @user = Toqui.user_class.new
    end

    def create
      just_before_registration
      creation = Toqui.user_class.register registration_params
      just_after_registration
      redirect_after_registration
    end

    def edit
      pp "edit"
    end

    def update
    end

    def destroy
    end

    private
    def registration_params
      params.require(params_name_for_user_class).permit(
        *user_class_attributes.concat([:password, :password_confirmation])
      )      
    end
  end
end
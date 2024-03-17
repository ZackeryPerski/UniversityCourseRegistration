class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      if resource.persisted?
        # update the University ID
      end
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :university_id, student_attributes: [:major, :is_undergraduate]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:id, :first_name, :last_name, :university_id, student_attributes: [:major, :is_undergraduate]])
  end
end
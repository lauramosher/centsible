class RegistrationsController < Devise::RegistrationsController
  private

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
      flash[:notice] = "Welcome"
      intro_path
  end

end

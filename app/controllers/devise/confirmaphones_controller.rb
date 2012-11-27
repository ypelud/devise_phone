
class Devise::ConfirmaphonesController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show                      
    self.resource=resource_class.confirm_by_token_phone(params[:phone], params[:confirmation_token])
    if resource.errors.empty?       
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }      
    else
      super
    end
  end

end

class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def set_parent
    @parents = Category.where(ancestry: nil)
  end
  
  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_furi, :first_name_furi, :birth, :send_last_name, :send_first_name, :send_last_name_furi, :send_first_name_furi, :post, :prefecture, :city, :block, :building, :phone])
    end
end

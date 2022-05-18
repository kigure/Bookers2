class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:top, :about] #ログインしてないユーザーが入れる場所
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(current_user)# ログイン後に遷移するpath
  end


  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpath
  end
  
  

  protected
#新規登録時にnameとemailの情報も受け取れるように
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end





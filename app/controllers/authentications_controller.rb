class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      sign_in(authentication.user)
      gflash :success => "Signed in."
      #redirect_to root_url
      redirect to root_path
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      gflash :success => "Authentication added."
      redirect_to edit_user_path(current_user) + '?return=me' 
    else
      gflash :error => "You must add this authentication to your profile before using it."
      redirect_to new_user_registration_url 
      #JDavis: might need to change this such that it only requests an account vs creating one.
      #JDavis: Also need to create a manner in which the requestor picks a company.
      #JDavis:  Arrrrgh!
      #user = User.new
      #user.apply_omniauth(omniauth)
      #user.active = false
      #if user.save
      #  flash[:notice] = "Thanks for registering. Waiting on administrator approval to active your account."
      #  sign_in_and_redirect(:user, user)
        #redirect_to root_url
      #else
      #  flash[:notice] = authentication
      #  session[:omniauth] = omniauth.except('extra')
      #  redirect_to new_user_registration_url
      #end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    gflash :success => "Authentication destroyed." if @authentication.destroy
    redirect_to edit_user_path(current_user) + '?return=me'
  end
  
  def auth_fail
    gflash :error => "Authentication failed."
    redirect_to new_user_registration_url
  end
end

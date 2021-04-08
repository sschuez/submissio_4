class OmniauthController < ApplicationController
  
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      # flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      # redirect_to new_user_registration_url
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
    
end

# google_Oauth2
# google_oauth2
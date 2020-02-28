class SigninUsersController < ApplicationController

  def show  
    sign_in User.find(session[:id]) unless user_signed_in?
  end
end

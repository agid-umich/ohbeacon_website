class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies.signed[:user_id] = user.id
    redirect_to request.env['omniauth.origin'] || root_path
  end
end

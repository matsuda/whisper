class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.new(auth['nickname'], auth['name'], auth['Twitter'], auth['image'])
    session[:user] = user
    redirecut_to :dashboard_path, :notice => 'Signed in'
  end

  def destroy
    session[:user] = nil
    redirecut_to :root_url, :notice => 'Signed out'
  end
end

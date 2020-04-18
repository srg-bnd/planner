class AuthController < ApplicationController
  def new; end

  def create
    session[:secret_token] = auth_params[:secret_token]
    redirect_to need_url!
  end

  protected

  def auth_params
    params.require(:auth).permit(:secret_token)
  end
end

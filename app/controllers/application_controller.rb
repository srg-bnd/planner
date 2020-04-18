class ApplicationController < ActionController::Base
  
  private

  def have_access?
    if session[:secret_token] == ENV['CONTROLLER_SECRET_TOKEN']
      yield
    else
      session[:need_url] = request.original_url
      redirect_to new_auth_url
      # raise ActionController::RoutingError.new('Forbidden')
    end
  end

  def need_url!
    need_url = session[:need_url] || root_path
    session[:need_url] = nil

    need_url
  end
end

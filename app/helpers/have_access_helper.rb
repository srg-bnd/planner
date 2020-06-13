module HaveAccessHelper
  def have_access?
    return if session[:secret_token] == ENV['CONTROLLER_SECRET_TOKEN']

    session[:need_url] = request.original_url
    redirect_to '#url'
    # raise ActionController::RoutingError.new('Forbidden')
  end

  def need_url!
    need_url = session[:need_url] || root_path
    session[:need_url] = nil

    need_url
  end
end

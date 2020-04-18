class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def switch_locale(&action)
    puts request.base_url, request.original_fullpath, "#####3", request.env['PATH_INFO']
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

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

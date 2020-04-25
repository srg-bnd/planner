class ApplicationController < ActionController::Base
  add_flash_types :primary, :secondary, :success, :danger,
                  :warning, :info, :light, :dark
  around_action :switch_locale

  private

  def pagination(objects)
    return objects unless params[:page].present?

    page = Paginator.page(objects, params)
    @pagination_info = page.info
    # return objects with pagination
    page.list
  end

  def switch_locale(&action)
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

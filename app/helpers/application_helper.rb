# frozen_string_literal: true

module ApplicationHelper
  LOCALES = %w[en ru].freeze

  def pagination(objects)
    return objects unless params[:page].present?

    page = Paginator.page(objects, params)
    @pagination_info = page.info
    page.list
  end

  def switch_locale(&action)
    locale = params[:locale]
    locale = I18n.default_locale if LOCALES.exclude?(locale)

    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end

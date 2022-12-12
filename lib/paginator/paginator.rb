# Pagination
require_relative 'info'
require_relative 'page'

module Paginator
  DEFAULT_PAGE = 1
  DEFAULT_PAGE_SIZE = 10

  def self.page(objects, params = {})
    params = init_params(params)

    list = objects.offset((params[:page] - 1) * params[:per_page])
                  .limit(params[:per_page] + 1)

    if list.length > params[:per_page]
      params[:has_more] = true
      list = list[0...-1]
    end

    info = create_info(params)
    Page.new(list, info)
  end

  def self.init_params(params)
    page = params.fetch(:page, DEFAULT_PAGE).to_i
    per_page = params.fetch(:per_page, DEFAULT_PAGE_SIZE).to_i
    { page: page, per_page: per_page, has_more: false }
  end

  def self.create_info(params)
    Info.new(
      page: params[:page],
      per_page: params[:per_page],
      has_more: params[:has_more]
    )
  end
end

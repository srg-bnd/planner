module Paginator
  class Info
    attr_accessor :page, :per_page, :has_more, :total_count, :total_pages

    def initialize(**params)
      @page = params[:page]
      @per_page = params[:per_page]
      @has_more = params[:has_more]
      @total_pages = params[:total_pages]
      @total_count = params[:total_pages]
    end
  end
end

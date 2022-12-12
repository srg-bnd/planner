module Paginator
  class Page
    attr_reader :list, :info

    def initialize(list, info)
      @list = list
      @info = info
    end
  end
end

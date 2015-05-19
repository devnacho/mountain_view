module MountainView
  class Configuration
    attr_accessor :included_stylesheets

    def initialize
      @included_stylesheets = []
    end
  end
end
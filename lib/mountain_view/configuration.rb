module MountainView
  class Configuration
    attr_accessor :included_stylesheets
    attr_reader :components_path

    def initialize
      @included_stylesheets = []
    end

    def components_path=(path)
      @components_path = Pathname.new(path)
    end
  end
end

module MountainView
  class Component
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def title
      @name.humanize
    end

    def styleguide_stubs
      YAML.load_file stubs_file
    end

    def stubs_file
      MountainView.configuration.components_path.join(name, "#{name}.yml")
    end

    def stubs?
      styleguide_stubs.is_a?(Array) && styleguide_stubs.any?
    rescue Errno::ENOENT
      false
    end
  end
end

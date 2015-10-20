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
      YAML.load_file stubs_file || {}
    rescue Errno::ENOENT
      {}
    end

    def component_stubs
      styleguide_stubs[:stubs] if stubs_correct_format?
    end

    def component_stubs?
      component_stubs.try(:any?) || false
    end

    def stubs_file
      MountainView.configuration.components_path.join(name, "#{name}.yml")
    end

    def stubs?
      styleguide_stubs.try(:any?) || false
    end

    def stubs_extra_info?
      !stubs_extra_info.empty?
    rescue NoMethodError
      false
    end

    def stubs_extra_info
      styleguide_stubs[:meta] if styleguide_stubs.try(:key?, :meta)
    end

    def stubs_correct_format?
      (stubs? && styleguide_stubs.try(:key?, :stubs)) || false
    end
  end
end

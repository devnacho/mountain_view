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
      YAML.load_file(stubs_file) || {}
    rescue Errno::ENOENT
      {}
    end

    def component_stubs
      stubs_correct_format? ? styleguide_stubs[:stubs] : {}
    end

    def component_stubs?
      component_stubs.any?
    end

    def stubs_file
      MountainView.configuration.components_path.join(name, "#{name}.yml")
    end

    def stubs?
      styleguide_stubs.any?
    end

    def stubs_extra_info?
      !stubs_extra_info.empty?
    end

    def stubs_extra_info
      if styleguide_stubs.is_a?(Hash)
        if styleguide_stubs.key?(:meta)
          styleguide_stubs[:meta]
        else
          {}
        end
      else
        {}
      end
    end

    def stubs_correct_format?
      styleguide_stubs.is_a?(Hash) ? styleguide_stubs.key?(:stubs) : false
    end
  end
end

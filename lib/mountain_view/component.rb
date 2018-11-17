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

    def extracted_stubs
      if styleguide_stubs.is_a?(Hash)
        # Stub is coming from Style Guide example file
        styleguide_stubs[:stubs] || {}
      elsif styleguide_stubs.is_a?(Array)
        # Stub is coming from use of component
        styleguide_stubs
      end
    end

    def component_stubs
      stub_array = []
      extracted_stubs.each do | component_properties |
        stub_array << MountainView::Stub.new(component_properties)
      end
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
      if styleguide_stubs.is_a?(Hash) && styleguide_stubs.key?(:meta)
        styleguide_stubs[:meta]
      else
        {}
      end
    end

    def stubs_correct_format?
      stubs_are_a_hash_with_info? || styleguide_stubs.is_a?(Array)
    end

    def stubs_are_a_hash_with_info?
      styleguide_stubs.is_a?(Hash) && styleguide_stubs.key?(:stubs)
    end

  end
end

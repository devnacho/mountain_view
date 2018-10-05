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
      if styleguide_stubs.is_a?(Hash)
        # Stub is coming from Style Guide example file
        styleguide_stubs[:stubs] || {}
      elsif styleguide_stubs.is_a?(Array)
        # Stub is coming from use of component
        styleguide_stubs
      end
    end

    def component_stubs?
      component_stubs.any?
    end

    def component_stubs_extended
      component_stubs.map do |component_properties|
        MountainView::Stub.new(component_properties)
      end
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

    def example_title component_properties, index
      if component_properties.key?(:mv_title)
        component_properties[:mv_title]
      else
        title + " " + (index + 1).to_s
      end
    end

    def example_description component_properties
      if component_properties.key?(:mv_description)
        component_properties[:mv_description]
      end
    end

    def example_classes component_properties
      if component_properties.key?(:mv_classes)
        component_properties[:mv_classes]
      end
    end

  end
end

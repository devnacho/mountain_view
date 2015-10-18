module MountainView
  class Component
    attr_reader :name

    def self.stub_example
      File.read(File.expand_path('../example.yml',__FILE__))
    end

    def initialize(name)
      @name = name
    end

    def title
      @name.humanize
    end

    def styleguide_stubs
      YAML.load_file stubs_file
    end

    def component_stubs
      styleguide_stubs.first[:stubs]
    end

    def component_stubs?
      component_stubs.try(:any?) || false
    end

    def stubs_file
      MountainView.configuration.components_path.join(name, "#{name}.yml")
    end

    def stubs?
      styleguide_stubs.is_a?(Array) && styleguide_stubs.any?
    rescue Errno::ENOENT
      false
    end

    def stubs_extra_info?
      stubs_extra_info.try(:empty?) || false
    end

    def stubs_extra_info
      styleguide_stubs.first[:meta]
    end

    def stubs_correct_format?
      styleguide_stubs.first.key?(:stubs)
    end
  end
end

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
      Rails.root.join("app/components/#{name}/#{name}.yml")
    end

  end
end

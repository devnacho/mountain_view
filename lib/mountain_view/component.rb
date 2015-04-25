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

    def stubs?
      begin
        if styleguide_stubs.kind_of?(Array)
          styleguide_stubs.any?
        else
          false
        end
      rescue Errno::ENOENT
        false
      end
    end
  end
end

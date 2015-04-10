module MountainView
  module StyleguideHelper
    def mv_components
      Dir.glob(Rails.root.join("app", "components", "*")).map do |component_dir|
        File.basename component_dir
      end
    end

    def styleguide_stubs(component_name)
      stubs_file = Rails.root.join("app/components/#{component_name}/#{component_name}.yml")
      YAML.load_file stubs_file
    end
  end
end

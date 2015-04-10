module MountainView
  module StyleguideHelper
    def mv_components
      Dir.glob(Rails.root.join('app', 'components', '*')).map { |component_dir| File.basename component_dir }
    end

    def styleguide_stubs(component_name)
      YAML.load(File.read(File.expand_path("#{Rails.root}/app/components/#{component_name}/#{component_name}.yml", __FILE__)))
    end
  end
end

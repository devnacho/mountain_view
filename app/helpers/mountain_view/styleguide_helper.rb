module MountainView
  module StyleguideHelper
    def mv_components
      component_dirs = MountainView.configuration.components_path.join("*")
      Dir.glob(component_dirs).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end

    def render_example_stub(stubs)
      stubs.to_yaml.gsub('---', '')
    end
  end
end

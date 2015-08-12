module MountainView
  module StyleguideHelper
    def mv_components
      Dir.glob(MountainView.configuration.components_path.join("*")).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end
  end
end

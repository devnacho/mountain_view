module MountainView
  module StyleguideHelper
    def mv_components
      Dir.glob(Rails.root.join("app", "components", "*")).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end
  end
end

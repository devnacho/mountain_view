module MountainView
  module StyleguideHelper
    def prettify_word(word)
      word.to_s.split("_").map(&:capitalize).join(" ")
    end

    def mv_components
      component_dirs = MountainView.configuration.components_path.join("*")
      Dir.glob(component_dirs).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end
  end
end

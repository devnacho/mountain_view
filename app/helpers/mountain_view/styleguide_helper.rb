module MountainView
  module StyleguideHelper
    def mv_components
      component_dirs = MountainView.configuration.components_path.join("*")
      Dir.glob(component_dirs).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end

    def example_stubs
      <<-EOF.gsub(/^ {6}/, '')
        # This are just an example
        -
          :id: 1
          :title: "iyevuycveuyv"
          :subtitle: "ebcecbeuc"
        -
          :id: 2
          :title: "Yejvceuuvcue"
      EOF
    end
  end
end

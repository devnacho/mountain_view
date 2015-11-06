module MountainView
  module StyleguideHelper
    def mv_components
      component_dirs = MountainView.configuration.components_path.join("*")
      Dir.glob(component_dirs).map do |component_dir|
        MountainView::Component.new File.basename(component_dir)
      end
    end

    def example_stubs
      <<-EOF.strip_heredoc
      :stubs: #as many components as you need
        # This are just an example
        -
          :id: 1
          :title: "Some title"
          :subtitle: "Some subtitle"
        -
          :id: 2
          :title: "Another subtitle"
      EOF
    end
  end
end

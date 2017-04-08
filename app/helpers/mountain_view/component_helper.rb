module MountainView
  module ComponentHelper
    def render_component(slug, properties = {}, &block)
      component = MountainView::Presenter.component_for(slug, properties)
      component.render(controller.view_context) do
        capture(&block) if block_given?
      end
    end
  end
end

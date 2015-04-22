module MountainView
  module ComponentHelper
    def render_component(slug, properties = {})
      render "#{slug}/#{slug}", properties: properties
    end
  end
end

module MountainView
  module ComponentHelper
    def ui_component(slug, properties = {})
      render "#{slug}/#{slug}", properties: properties
    end
  end
end

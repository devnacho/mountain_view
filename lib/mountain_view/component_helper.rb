module MountainView
  module ComponentHelper

    def ui_component(slug, properties={})
      render "components/#{slug}/#{slug}", properties
    end

  end
end

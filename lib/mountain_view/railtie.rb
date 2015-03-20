require 'mountain_view'
require 'rails'

module MountainView
  class Railtie < Rails::Railtie
    railtie_name :mountain_view

    initializer "mountain_view.assets" do
      Rails.application.config.assets.paths << "#{Rails.root}/app/components"
    end


    initializer "mountain_view.append_view_paths" do |app|
      ActiveSupport.on_load :action_controller do
        append_view_path app.root.join("app", "components")
      end
    end

    initializer "mountain_view.component_helper" do
      ActiveSupport.on_load :action_view do
        include MountainView::ComponentHelper
      end
    end

  end
end

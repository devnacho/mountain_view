require 'mountain_view'
require 'rails'

module MountainView
  class Engine < Rails::Engine
    initializer "mountain_view.assets" do |app|
      Rails.application.config.assets.paths << app.root.join("app", "components")
    end

    initializer "mountain_view.append_view_paths" do |app|
      ActiveSupport.on_load :action_controller do
        append_view_path app.root.join("app", "components")
      end
    end
  end
end

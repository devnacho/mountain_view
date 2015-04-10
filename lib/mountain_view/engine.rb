require 'mountain_view'
require 'rails'

module MountainView
  class Engine < ::Rails::Engine
    isolate_namespace MountainView

    initializer "mountain_view.assets" do |app|
      Rails.application.config.assets.paths << app.root.join("app", "components")
      Rails.application.config.assets.precompile += %w( mountain_view/styleguide.css
                                                        mountain_view/styleguide.js )
    end

    initializer "mountain_view.append_view_paths" do |app|
      ActiveSupport.on_load :action_controller do
        append_view_path app.root.join("app", "components")
      end
    end

    initializer "mountain_view.add_helpers" do
      ActiveSupport.on_load :action_controller do
        helper MountainView::ComponentHelper
      end
    end
  end
end

require 'mountain_view'
require 'rails'

module MountainView
  class Railtie < Rails::Railtie
    railtie_name :mountain_view

    initializer "mountain_view.component_helper" do
      #ActionView::Base.send :include, MountainView::ComponentHelper
      ActiveSupport.on_load :action_view do
        include MountainView::ComponentHelper
      end
    end

  end
end

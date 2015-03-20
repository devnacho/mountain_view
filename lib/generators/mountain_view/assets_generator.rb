require "rails/generators/base"

module MountainView
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates CSS and JS files to require all components assets"

      def create_css_file
        template "mountain_view.css", "app/components/mountain_view.css"
      end

      def create_js_file
        template "mountain_view.js", "app/components/mountain_view.js"
      end
    end
  end
end

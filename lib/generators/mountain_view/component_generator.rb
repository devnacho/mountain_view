require "rails/generators/base"

module MountainView
  module Generators
    class ComponentGenerator < Rails::Generators::Base
      desc "Generates all files needed for a component"

      argument :component, required: true,
                           desc: "Component name, e.g: header, widget"

      def create_view_file
        create_file "app/components/#{component}/_#{component}.html.erb"
      end

      def create_css_file
        create_file "app/components/#{component}/#{component}.css"
      end

      def create_js_file
        create_file "app/components/#{component}/#{component}.js"
      end

      def create_stubs_file
        create_file "app/components/#{component}/#{component}.yml"
      end
    end
  end
end

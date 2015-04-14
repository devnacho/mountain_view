require "rails/generators/base"

module MountainView
  module Generators
    class ComponentGenerator < Rails::Generators::Base
      desc "Generates all files needed for a component"

      argument :component, required: true,
                           desc: "Component name, e.g: header, widget"

      def create_view_file
        create_file "app/components/#{component}/_#{component}.html.#{template_engine}"
      end

      def create_css_file
        create_file "app/components/#{component}/#{component}.#{stylesheet_engine}"
      end

      def create_js_file
        create_file "app/components/#{component}/#{component}.#{javascript_engine}"
      end

      def create_stubs_file
        create_file "app/components/#{component}/#{component}.yml"
      end

      private

      def template_engine
        app_generators[:template_engine] || "erb"
      end

      def stylesheet_engine
        app_generators[:stylesheet_engine] || "css"
      end

      def javascript_engine
        app_generators[:javascript_engine] || "js"
      end

      def app_generators
        Rails.application.config.generators.rails
      end
    end
  end
end

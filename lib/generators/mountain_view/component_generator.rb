# frozen_string_literal: true

require_relative "./mountain_view_generator_base"

module MountainView
  module Generators
    class ComponentGenerator < MountainViewGeneratorBase
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
    end
  end
end

# frozen_string_literal: true

require "rails/generators/base"

module MountainView
  module Generators
    class MountainViewGeneratorBase < Rails::Generators::Base
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

      def extra_pages
        MountainView.configuration.extra_pages
      end
    end
  end
end

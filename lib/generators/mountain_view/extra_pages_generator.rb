# frozen_string_literal: true

require_relative "./mountain_view_generator_base"

module MountainView
  module Generators
    class ExtraPagesGenerator < MountainViewGeneratorBase
      desc "Generates extra pages and routes"

      def create_extra_pages_views
        views_folder = "app/views/mountain_view/extra_pages"
        extra_pages.each do |page|
          file_name = "#{views_folder}/#{page}.html.#{template_engine}"
          next if File.exist?(file_name)
          create_file file_name
        end
      end
    end
  end
end

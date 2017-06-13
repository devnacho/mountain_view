# frozen_string_literal: true

require 'test_helper'

class ExtraPagesGeneratorTest < Rails::Generators::TestCase
  tests MountainView::Generators::ExtraPagesGenerator

  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all views and controller are created" do
    # reset templates
    Rails.application.config.app_generators.template_engine nil
    Rails.application.config.app_generators.stylesheet_engine nil

    MountainView.configuration.extra_pages = %I(grid style_status)
    run_generator

    MountainView.configuration.extra_pages.each do |page|
      assert_file "app/views/mountain_view/extra_pages/#{page}.html.erb"
    end
  end
end

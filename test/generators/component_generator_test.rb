require "test_helper"

class ComponentGeneratorTest < Rails::Generators::TestCase
  tests MountainView::Generators::ComponentGenerator

  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    # reset engines
    Rails.application.config.app_generators.template_engine nil
    Rails.application.config.app_generators.stylesheet_engine nil
    Rails.application.config.app_generators.javascript_engine nil

    run_generator %w(widget)

    assert_file "app/components/widget/_widget.html.erb"
    assert_file "app/components/widget/widget.css"
    assert_file "app/components/widget/widget.js"
    assert_file "app/components/widget/widget.yml"
  end

  test "Generates different engines" do
    Rails.application.config.app_generators.template_engine :haml
    Rails.application.config.app_generators.stylesheet_engine :scss
    Rails.application.config.app_generators.javascript_engine :coffee

    run_generator %w(widget)

    assert_file "app/components/widget/_widget.html.haml"
    assert_file "app/components/widget/widget.scss"
    assert_file "app/components/widget/widget.coffee"
    assert_file "app/components/widget/widget.yml"
  end
end

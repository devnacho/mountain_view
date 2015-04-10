require "test_helper"

class ComponentGeneratorTest < Rails::Generators::TestCase
  tests MountainView::Generators::ComponentGenerator

  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator %w( widget )

    assert_file "app/components/widget/_widget.html.erb"
    assert_file "app/components/widget/widget.css"
    assert_file "app/components/widget/widget.js"
    assert_file "app/components/widget/widget.yml"
  end
end

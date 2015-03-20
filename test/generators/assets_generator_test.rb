require "test_helper"

class AssetsGeneratorTest < Rails::Generators::TestCase
  tests MountainView::Generators::AssetsGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file "app/components/mountain_view.css"
    assert_file "app/components/mountain_view.js"
  end
end

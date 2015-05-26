require "test_helper"

class MountainViewConfigurationTest < ActiveSupport::TestCase
  test "default value for included_stylesheets is an empty array" do
    assert_equal MountainView::Configuration.new.included_stylesheets, []
  end

  test "set custom included_stylesheets" do
    config = MountainView::Configuration.new
    config.included_stylesheets = ["global", "fonts"]

    assert_equal config.included_stylesheets, ["global", "fonts"]
  end
end

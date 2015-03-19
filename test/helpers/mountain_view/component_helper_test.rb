require 'test_helper'

class MountainView::ComponentHelperTest < ActionView::TestCase
  test "renders the proper component" do
    rendered = ui_component("header", title: "Pepe")

    expected = /This is a header component with the title: Pepe/

    assert_match expected, rendered
  end
end

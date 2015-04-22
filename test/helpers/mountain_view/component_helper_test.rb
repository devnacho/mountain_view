require 'test_helper'

class MountainView::ComponentHelperTest < ActionView::TestCase
  test "renders the proper component" do
    rendered = render_component("header", title: "Pepe")

    expected = /Pepe/

    assert_match expected, rendered
  end
end

require 'test_helper'

class MountainView::ComponentHelperTest < ActionView::TestCase
  test "renders the proper component" do
    rendered = render_component("header", id: 1, title: "Pepe")

    expected = /Pepe/

    assert_match expected, rendered
    assert_match %r(href=\"\/products\/1\"), rendered
  end

  test "renders the component with `rc` alias" do
    rendered = render_component("header", id: 1, title: "Pepe")

    expected = /Pepe/

    assert_match expected, rendered
    assert_match %r(href=\"\/products\/1\"), rendered
  end

  test "renders when passed a block" do
    rendered = render_component("yielder") do
      "I appear to be in a block"
    end

    expected = /<div class=\"yield-here\">\n    I appear to be in a block\n  <\/div>/
    assert_match expected, rendered
    assert_match /Tell me about the Proc/, rendered
  end

  test "Does not override passed yield property with block" do
    rendered = render_component("yielder", yield: "It is me in the block") do
      "I appear to be in a block"
    end

    expected = /<div class=\"yield-here\">\n    It is me in the block\n  <\/div>/
    assert_match expected, rendered
    assert_match /Tell me about the Proc/, rendered
  end

  test "renders when has a yield, but no block passed" do
    rendered = render_component("yielder")

    assert_match /Tell me about the Proc/, rendered
  end

  test "renders a component within a compontent" do
    rendered = render_component("yielder") do
      render_component("header", id: 1, title: "Pepe")
    end

    assert_match /Pepe/, rendered
    assert_match %r(href=\"\/products\/1\"), rendered
  end
end

require "test_helper"

class MountainViewComponentTest < MiniTest::Test
  def test_name
    component = MountainView::Component.new("header")

    assert_equal "header", component.name
  end

  def test_humanized_title
    component = MountainView::Component.new("social_media_icons")

    assert_equal "Social media icons", component.title
  end

  def test_styleguide_stubs
    component = MountainView::Component.new("header")

    expected_stub = {
      title: "20 Mountains you didn't know they even existed",
      subtitle: "Buzzfeed title"
    }

    assert_instance_of Array, component.styleguide_stubs
    assert_equal expected_stub, component.styleguide_stubs.first
  end
end

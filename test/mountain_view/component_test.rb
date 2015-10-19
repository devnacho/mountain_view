require "test_helper"

class MountainViewComponentTest < ActiveSupport::TestCase
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
    expected_stub =
      {
        meta: "There is this different classes",
        stubs:
          [
            {
              id:  1,
              title: "20 Mountains you didn't know they even existed",
              subtitle: "Buzzfeed title"
            },
            { id: 2,
              title: "You won't believe what happened to this man at Aspen"
            }
          ]
      }

    assert_instance_of Array, component.styleguide_stubs
    assert_equal expected_stub, component.styleguide_stubs.first
  end

  def test_component_stubs
    component = MountainView::Component.new("header")
    expected_stub =
      [
        {
          id: 1,
          title: "20 Mountains you didn't know they even existed",
          subtitle: "Buzzfeed title"
        },
        {
          id: 2,
          title: "You won't believe what happened to this man at Aspen"
        }
      ]

    assert_instance_of Array, component.component_stubs
    assert_equal expected_stub, component.component_stubs
  end

  def test_component_stubs?
    component_with_stubs = MountainView::Component.new("header")
    component_with_empty_stub_file = MountainView::Component.new("breadcrumbs")
    component_without_stub_file =
      MountainView::Component.new("social_media_icons")
    compoenet_with_stubs_but_incorrect_format =
      MountainView::Component.new("card")

    assert_equal true, component_with_stubs.component_stubs?
    assert_equal false, component_without_stub_file.component_stubs?
    assert_equal false, component_with_empty_stub_file.component_stubs?
    assert_equal false, compoenet_with_stubs_but_incorrect_format.
      component_stubs?
  end

  def test_stubs_extra_info
    component_with_extra_info = MountainView::Component.new("header")
    component_with_empty_stub_file =
      MountainView::Component.new("breadcrumbs")
    component_without_stub_file =
      MountainView::Component.new("social_media_icons")
    expected_extra_info_stub = "There is this different classes"

    assert_equal expected_extra_info_stub, component_with_extra_info.
      stubs_extra_info
    assert_equal nil, component_with_empty_stub_file.stubs_extra_info
    assert_equal nil, component_without_stub_file.stubs_extra_info
  end

  def test_stubs_extra_info?
    component_with_stubs = MountainView::Component.new("header")
    component_with_empty_stub_file =
      MountainView::Component.new("breadcrumbs")
    component_without_stub_file =
      MountainView::Component.new("social_media_icons")
    compoenet_with_stubs_but_incorrect_format =
      MountainView::Component.new("card")

    assert_equal true, component_with_stubs.stubs_extra_info?
    assert_equal false, component_without_stub_file.stubs_extra_info?
    assert_equal false, component_with_empty_stub_file.stubs_extra_info?
    assert_equal false, compoenet_with_stubs_but_incorrect_format.
      stubs_extra_info?
  end

  def test_stubs_correct_format?
    component_with_correct_stubs = MountainView::Component.new("header")
    component_with_empty_stub_file = MountainView::Component.new("breadcrumbs")
    component_without_stub_file =
      MountainView::Component.new("social_media_icons")
    compoenet_with_stubs_but_incorrect_format =
      MountainView::Component.new("card")

    assert_equal true, component_with_correct_stubs.stubs_correct_format?
    assert_equal false, component_without_stub_file.stubs_correct_format?
    assert_equal false, component_with_empty_stub_file.stubs_correct_format?
    assert_equal false, compoenet_with_stubs_but_incorrect_format.
      stubs_correct_format?
  end

  def test_stub_example
    expected_output = <<-EOF

- :meta: 'information about the component' #optional
  :stubs: #as many components as you need
    -
      :id: 1
      :title: \"iyevuycveuyv\"
      :subtitle: \"ebcecbeuc\"
    -
      :id: 2
      :title: \"Yejvceuuvcue\"
    EOF

    assert_equal expected_output, MountainView::Component.stub_example
  end

  def test_stubs_file
    component = MountainView::Component.new("header")

    expected_stubs_file = Rails.root.join("app/components/header/header.yml")
    assert_equal expected_stubs_file, component.stubs_file
  end

  def test_stubs?
    component_with_stubs = MountainView::Component.new("header")
    component_without_stub_file = MountainView::Component.new("social_media_icons")
    component_with_empty_stub_file = MountainView::Component.new("breadcrumbs")

    assert_equal true, component_with_stubs.stubs?
    assert_equal false, component_without_stub_file.stubs?
    assert_equal false, component_with_empty_stub_file.stubs?
  end
end

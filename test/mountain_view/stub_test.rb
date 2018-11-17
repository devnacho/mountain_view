require 'test_helper'
class MountainViewStubTest < ActiveSupport::TestCase
  def test_meta_title
    test_object = stub_to_test

    assert_equal header_stub_meta[:stubs][0][:mv_stub_meta][:title],
                 test_object[0].meta_title('Header', 0)
    assert_equal 'Header 2', test_object[1].meta_title('Header', 1)
  end

  def test_meta_description
    test_object = stub_to_test
    assert_equal header_stub_meta[:stubs][0][:mv_stub_meta][:description],
                 test_object[0].meta_description
    assert_nil test_object[1].meta_description
  end

  def test_meta_classes
    test_object = stub_to_test
    assert_equal header_stub_meta[:stubs][0][:mv_stub_meta][:classes],
                 test_object[0].meta_classes
    assert_nil test_object[1].meta_classes
  end

  def test_properties
    test_object = stub_to_test
    assert_equal header_stub_meta[:stubs][0].except(:mv_stub_meta),
                 test_object[0].properties
    assert_equal header_stub_meta[:stubs][1], test_object[1].properties
  end

  private

  def stub_to_test
    MountainView::Component.new('header').component_stubs
  end
end

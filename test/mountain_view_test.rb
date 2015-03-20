require 'test_helper'

class MountainViewTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "engine is loaded" do
    assert_equal ::Rails::Engine, MountainView::Engine.superclass
  end

  test "stylesheets are properly served" do
    get "/assets/mountain_view.css"
    assert_response :success
    refute_match(/FileNotFound/, response.body)
  end

  test "javascripts are properly served" do
    get "/assets/mountain_view.js"
    assert_response :success
    refute_match(/FileNotFound/, response.body)
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end
end

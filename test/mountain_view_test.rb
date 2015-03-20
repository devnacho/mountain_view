require 'test_helper'

class MountainViewTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "engine is loaded" do
    assert_equal ::Rails::Engine, MountainView::Engine.superclass
  end

  test "stylesheets are served" do
    get "/assets/mountain_view.css"
    assert_response :success
  end

  test "javascripts are served" do
    get "/assets/mountain_view.js"
    assert_response :success
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end
end

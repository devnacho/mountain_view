class MountedEngineTest < ActionDispatch::IntegrationTest
  test "Has been mounted successfully" do
    get "/mountain_view"
    assert_response :success
  end

  test "Has the styleguide route" do
    get "/mountain_view/styleguide"
    assert_response :success
  end

  test "Custom path can be applied to styleguide resource" do
    styleguide_path = MountainView.configuration.styleguide_path

    # Set the new path
    MountainView.configuration.styleguide_path = "style-guide"
    Rails.application.reload_routes!

    get "/mountain_view/style-guide"
    assert_response :success

    # Reset back to original
    MountainView.configuration.styleguide_path = styleguide_path
    Rails.application.reload_routes!
  end
end

class RendersComponentInView < ActionDispatch::IntegrationTest
  test "Renders component successfully" do
    get "/"
    assert_select 'h1', 'Products'
    assert_response :success
  end
end

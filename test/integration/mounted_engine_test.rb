class MountedEngineTest < ActionDispatch::IntegrationTest
  test 'Has been mounuted successfully' do
    get '/mountain_view'
    assert_response :success
  end
end

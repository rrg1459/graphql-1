require "test_helper"

class AnalizaControllerTest < ActionDispatch::IntegrationTest
  test "should get lee" do
    get analiza_lee_url
    assert_response :success
  end
end

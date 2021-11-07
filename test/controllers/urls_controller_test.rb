require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest

  test "create action" do
    post "/urls",
         params: {
                     url: {
                       long_url: "http://example1.com"
                     }
                   }
    assert json_response["url"]["short_url"]
  end

  test "show action" do
    url = urls(:one)
    get "/urls/#{url.short_url}"
    assert_equal json_response["url"]["long_url"], url.long_url
  end

  test "stats increases by 1, when received short_url" do
    url = urls(:one)
    get "/urls/#{url.short_url}/stats"
    assert_equal json_response["stats"], 0
    get "/urls/#{url.short_url}"
    get "/urls/#{url.short_url}/stats"
    assert_equal json_response["stats"], 1
  end

end

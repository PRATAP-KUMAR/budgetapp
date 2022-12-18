require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get budget_app' do
    get pages_budget_app_url
    assert_response :success
  end
end

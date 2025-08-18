require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

test "should get root" do
  get root_url
  assert_response :success
  assert_select "title", "Home | #{@base_title}"
end



test "root should render the home page" do
  get root_url
  root_body = @response.body  # ルートのレスポンスを保存

  get static_pages_home_url
  home_body = @response.body  # ホームのレスポンスを保存

  assert_equal root_body, home_body  # 両者が同じHTMLか確認
end


  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end

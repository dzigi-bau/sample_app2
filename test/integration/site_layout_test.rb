require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links for logged out users" do
  get root_path
  assert_template "static_pages/home"
  assert_select "a[href=?]", root_path, count: 2
  assert_select "a[href=?]", help_path
  assert_select "a[href=?]", about_path
  assert_select "a[href=?]", contact_path
  assert_select "a[href=?]", "https://news.railstutorial.org/"
  get signup_path
  assert_select "title", full_title("Sign up")
  end
  test "layout links for logged in users" do
  get root_path
  assert_template "static_pages/home"
  log_in_as(users(:michael))
  assert is_logged_in?
  get root_path
  assert_select "a[href=?]", users_path
  get edit_user_path(users(:michael))
  assert_select "a[href=?]", edit_user_path
  assert_select "a[href=?]", user_path(users(:michael))
  end
end

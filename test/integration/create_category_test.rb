require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "Juan", email: "juan@gmail.com", password: "juan123", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get "/categories/new" # to reach out the path
    assert_response :success # to expext a :success respond

    # To create a new category and test the redirect action
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end

    # In order to follow the redirect
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body # The word "Sports" should present on the HTML file
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new" # to reach out the path
    assert_response :success # to expext a :success respond

    # To create a new category passing an invalid value, this would be create errors messages
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: " " } }
    end

    # Lookin for errors messages on the page
    assert_match "errors", response.body # The word "errors" should present on the HTML file
    assert_select "div.alert" # to check if in the page we have this element
    assert_select "h4.alert-heading" # to check if in the page we have this element
  end
end
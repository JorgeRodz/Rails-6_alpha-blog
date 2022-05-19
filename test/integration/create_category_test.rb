require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
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
end
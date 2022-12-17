require "test_helper"

class TodosetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todoset = todosets(:one)
  end

  test "should get index" do
    get todosets_url
    assert_response :success
  end

  test "should get new" do
    get new_todoset_url
    assert_response :success
  end

  test "should create todoset" do
    assert_difference("Todoset.count") do
      post todosets_url, params: { todoset: { description: @todoset.description, name: @todoset.name, project_id: @todoset.project_id } }
    end

    assert_redirected_to todoset_url(Todoset.last)
  end

  test "should show todoset" do
    get todoset_url(@todoset)
    assert_response :success
  end

  test "should get edit" do
    get edit_todoset_url(@todoset)
    assert_response :success
  end

  test "should update todoset" do
    patch todoset_url(@todoset), params: { todoset: { description: @todoset.description, name: @todoset.name, project_id: @todoset.project_id } }
    assert_redirected_to todoset_url(@todoset)
  end

  test "should destroy todoset" do
    assert_difference("Todoset.count", -1) do
      delete todoset_url(@todoset)
    end

    assert_redirected_to todosets_url
  end
end

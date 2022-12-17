require "application_system_test_case"

class TodosetsTest < ApplicationSystemTestCase
  setup do
    @todoset = todosets(:one)
  end

  test "visiting the index" do
    visit todosets_url
    assert_selector "h1", text: "Todosets"
  end

  test "should create todoset" do
    visit todosets_url
    click_on "New todoset"

    fill_in "Description", with: @todoset.description
    fill_in "Name", with: @todoset.name
    fill_in "Project", with: @todoset.project_id
    click_on "Create Todoset"

    assert_text "Todoset was successfully created"
    click_on "Back"
  end

  test "should update Todoset" do
    visit todoset_url(@todoset)
    click_on "Edit this todoset", match: :first

    fill_in "Description", with: @todoset.description
    fill_in "Name", with: @todoset.name
    fill_in "Project", with: @todoset.project_id
    click_on "Update Todoset"

    assert_text "Todoset was successfully updated"
    click_on "Back"
  end

  test "should destroy Todoset" do
    visit todoset_url(@todoset)
    click_on "Destroy this todoset", match: :first

    assert_text "Todoset was successfully destroyed"
  end
end

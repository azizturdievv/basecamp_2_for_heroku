require "application_system_test_case"

class MessageBoardsTest < ApplicationSystemTestCase
  setup do
    @message_board = message_boards(:one)
  end

  test "visiting the index" do
    visit message_boards_url
    assert_selector "h1", text: "Message boards"
  end

  test "should create message board" do
    visit message_boards_url
    click_on "New message board"

    fill_in "Name", with: @message_board.name
    fill_in "Project", with: @message_board.project_id
    click_on "Create Message board"

    assert_text "Message board was successfully created"
    click_on "Back"
  end

  test "should update Message board" do
    visit message_board_url(@message_board)
    click_on "Edit this message board", match: :first

    fill_in "Name", with: @message_board.name
    fill_in "Project", with: @message_board.project_id
    click_on "Update Message board"

    assert_text "Message board was successfully updated"
    click_on "Back"
  end

  test "should destroy Message board" do
    visit message_board_url(@message_board)
    click_on "Destroy this message board", match: :first

    assert_text "Message board was successfully destroyed"
  end
end

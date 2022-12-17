require "application_system_test_case"

class VaultsTest < ApplicationSystemTestCase
  setup do
    @vault = vaults(:one)
  end

  test "visiting the index" do
    visit vaults_url
    assert_selector "h1", text: "Vaults"
  end

  test "should create vault" do
    visit vaults_url
    click_on "New vault"

    fill_in "Name", with: @vault.name
    fill_in "Project", with: @vault.project_id
    click_on "Create Vault"

    assert_text "Vault was successfully created"
    click_on "Back"
  end

  test "should update Vault" do
    visit vault_url(@vault)
    click_on "Edit this vault", match: :first

    fill_in "Name", with: @vault.name
    fill_in "Project", with: @vault.project_id
    click_on "Update Vault"

    assert_text "Vault was successfully updated"
    click_on "Back"
  end

  test "should destroy Vault" do
    visit vault_url(@vault)
    click_on "Destroy this vault", match: :first

    assert_text "Vault was successfully destroyed"
  end
end

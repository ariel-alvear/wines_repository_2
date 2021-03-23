require "application_system_test_case"

class EnologistsTest < ApplicationSystemTestCase
  setup do
    @enologist = enologists(:one)
  end

  test "visiting the index" do
    visit enologists_url
    assert_selector "h1", text: "Enologists"
  end

  test "creating a Enologist" do
    visit enologists_url
    click_on "New Enologist"

    fill_in "Age", with: @enologist.age
    fill_in "Nacionality", with: @enologist.nacionality
    fill_in "Name", with: @enologist.name
    click_on "Create Enologist"

    assert_text "Enologist was successfully created"
    click_on "Back"
  end

  test "updating a Enologist" do
    visit enologists_url
    click_on "Edit", match: :first

    fill_in "Age", with: @enologist.age
    fill_in "Nacionality", with: @enologist.nacionality
    fill_in "Name", with: @enologist.name
    click_on "Update Enologist"

    assert_text "Enologist was successfully updated"
    click_on "Back"
  end

  test "destroying a Enologist" do
    visit enologists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enologist was successfully destroyed"
  end
end

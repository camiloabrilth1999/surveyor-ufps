require "application_system_test_case"

class IdentificationTypesTest < ApplicationSystemTestCase
  setup do
    @identification_type = identification_types(:one)
  end

  test "visiting the index" do
    visit identification_types_url
    assert_selector "h1", text: "Identification Types"
  end

  test "creating a Identification type" do
    visit identification_types_url
    click_on "New Identification Type"

    fill_in "Description", with: @identification_type.description
    fill_in "Summary description", with: @identification_type.summary_description
    click_on "Create Identification type"

    assert_text "Identification type was successfully created"
    click_on "Back"
  end

  test "updating a Identification type" do
    visit identification_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @identification_type.description
    fill_in "Summary description", with: @identification_type.summary_description
    click_on "Update Identification type"

    assert_text "Identification type was successfully updated"
    click_on "Back"
  end

  test "destroying a Identification type" do
    visit identification_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Identification type was successfully destroyed"
  end
end

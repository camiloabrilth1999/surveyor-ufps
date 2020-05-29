require "application_system_test_case"

class AcademicDepartamentsTest < ApplicationSystemTestCase
  setup do
    @academic_departament = academic_departaments(:one)
  end

  test "visiting the index" do
    visit academic_departaments_url
    assert_selector "h1", text: "Academic Departaments"
  end

  test "creating a Academic departament" do
    visit academic_departaments_url
    click_on "New Academic Departament"

    fill_in "Code", with: @academic_departament.code
    fill_in "Name", with: @academic_departament.name
    click_on "Create Academic departament"

    assert_text "Academic departament was successfully created"
    click_on "Back"
  end

  test "updating a Academic departament" do
    visit academic_departaments_url
    click_on "Edit", match: :first

    fill_in "Code", with: @academic_departament.code
    fill_in "Name", with: @academic_departament.name
    click_on "Update Academic departament"

    assert_text "Academic departament was successfully updated"
    click_on "Back"
  end

  test "destroying a Academic departament" do
    visit academic_departaments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Academic departament was successfully destroyed"
  end
end

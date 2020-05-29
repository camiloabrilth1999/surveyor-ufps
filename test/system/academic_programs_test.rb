require "application_system_test_case"

class AcademicProgramsTest < ApplicationSystemTestCase
  setup do
    @academic_program = academic_programs(:one)
  end

  test "visiting the index" do
    visit academic_programs_url
    assert_selector "h1", text: "Academic Programs"
  end

  test "creating a Academic program" do
    visit academic_programs_url
    click_on "New Academic Program"

    fill_in "Code", with: @academic_program.code
    fill_in "Email", with: @academic_program.email
    fill_in "Name", with: @academic_program.name
    click_on "Create Academic program"

    assert_text "Academic program was successfully created"
    click_on "Back"
  end

  test "updating a Academic program" do
    visit academic_programs_url
    click_on "Edit", match: :first

    fill_in "Code", with: @academic_program.code
    fill_in "Email", with: @academic_program.email
    fill_in "Name", with: @academic_program.name
    click_on "Update Academic program"

    assert_text "Academic program was successfully updated"
    click_on "Back"
  end

  test "destroying a Academic program" do
    visit academic_programs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Academic program was successfully destroyed"
  end
end

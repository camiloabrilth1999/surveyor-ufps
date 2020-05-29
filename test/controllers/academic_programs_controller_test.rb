require 'test_helper'

class AcademicProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_program = academic_programs(:one)
  end

  test "should get index" do
    get academic_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_program_url
    assert_response :success
  end

  test "should create academic_program" do
    assert_difference('AcademicProgram.count') do
      post academic_programs_url, params: { academic_program: { code: @academic_program.code, email: @academic_program.email, name: @academic_program.name } }
    end

    assert_redirected_to academic_program_url(AcademicProgram.last)
  end

  test "should show academic_program" do
    get academic_program_url(@academic_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_program_url(@academic_program)
    assert_response :success
  end

  test "should update academic_program" do
    patch academic_program_url(@academic_program), params: { academic_program: { code: @academic_program.code, email: @academic_program.email, name: @academic_program.name } }
    assert_redirected_to academic_program_url(@academic_program)
  end

  test "should destroy academic_program" do
    assert_difference('AcademicProgram.count', -1) do
      delete academic_program_url(@academic_program)
    end

    assert_redirected_to academic_programs_url
  end
end

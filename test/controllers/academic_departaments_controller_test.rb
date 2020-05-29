require 'test_helper'

class AcademicDepartamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_departament = academic_departaments(:one)
  end

  test "should get index" do
    get academic_departaments_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_departament_url
    assert_response :success
  end

  test "should create academic_departament" do
    assert_difference('AcademicDepartament.count') do
      post academic_departaments_url, params: { academic_departament: { code: @academic_departament.code, name: @academic_departament.name } }
    end

    assert_redirected_to academic_departament_url(AcademicDepartament.last)
  end

  test "should show academic_departament" do
    get academic_departament_url(@academic_departament)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_departament_url(@academic_departament)
    assert_response :success
  end

  test "should update academic_departament" do
    patch academic_departament_url(@academic_departament), params: { academic_departament: { code: @academic_departament.code, name: @academic_departament.name } }
    assert_redirected_to academic_departament_url(@academic_departament)
  end

  test "should destroy academic_departament" do
    assert_difference('AcademicDepartament.count', -1) do
      delete academic_departament_url(@academic_departament)
    end

    assert_redirected_to academic_departaments_url
  end
end

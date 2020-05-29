require 'test_helper'

class IdentificationTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @identification_type = identification_types(:one)
  end

  test "should get index" do
    get identification_types_url
    assert_response :success
  end

  test "should get new" do
    get new_identification_type_url
    assert_response :success
  end

  test "should create identification_type" do
    assert_difference('IdentificationType.count') do
      post identification_types_url, params: { identification_type: { description: @identification_type.description, summary_description: @identification_type.summary_description } }
    end

    assert_redirected_to identification_type_url(IdentificationType.last)
  end

  test "should show identification_type" do
    get identification_type_url(@identification_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_identification_type_url(@identification_type)
    assert_response :success
  end

  test "should update identification_type" do
    patch identification_type_url(@identification_type), params: { identification_type: { description: @identification_type.description, summary_description: @identification_type.summary_description } }
    assert_redirected_to identification_type_url(@identification_type)
  end

  test "should destroy identification_type" do
    assert_difference('IdentificationType.count', -1) do
      delete identification_type_url(@identification_type)
    end

    assert_redirected_to identification_types_url
  end
end

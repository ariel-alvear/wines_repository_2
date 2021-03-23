require 'test_helper'

class EnologistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enologist = enologists(:one)
  end

  test "should get index" do
    get enologists_url
    assert_response :success
  end

  test "should get new" do
    get new_enologist_url
    assert_response :success
  end

  test "should create enologist" do
    assert_difference('Enologist.count') do
      post enologists_url, params: { enologist: { age: @enologist.age, nacionality: @enologist.nacionality, name: @enologist.name } }
    end

    assert_redirected_to enologist_url(Enologist.last)
  end

  test "should show enologist" do
    get enologist_url(@enologist)
    assert_response :success
  end

  test "should get edit" do
    get edit_enologist_url(@enologist)
    assert_response :success
  end

  test "should update enologist" do
    patch enologist_url(@enologist), params: { enologist: { age: @enologist.age, nacionality: @enologist.nacionality, name: @enologist.name } }
    assert_redirected_to enologist_url(@enologist)
  end

  test "should destroy enologist" do
    assert_difference('Enologist.count', -1) do
      delete enologist_url(@enologist)
    end

    assert_redirected_to enologists_url
  end
end

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get login" do
    get admin_login_url
    assert_response :success
  end

  test "should get checkLogin" do
    get admin_checkLogin_url
    assert_response :success
  end

  test "should get newUser" do
    get admin_newUser_url
    assert_response :success
  end

  test "should get newProduct" do
    get admin_newProduct_url
    assert_response :success
  end

  test "should get newBrand" do
    get admin_newBrand_url
    assert_response :success
  end

  test "should get editUser" do
    get admin_editUser_url
    assert_response :success
  end

  test "should get editProduct" do
    get admin_editProduct_url
    assert_response :success
  end

  test "should get editUser" do
    get admin_editUser_url
    assert_response :success
  end

  test "should get destroyBrand" do
    get admin_destroyBrand_url
    assert_response :success
  end

  test "should get destroyProduct" do
    get admin_destroyProduct_url
    assert_response :success
  end

end

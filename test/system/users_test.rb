require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "City", with: @user.city
    fill_in "Email", with: @user.email
    fill_in "Email confirmation", with: @user.email_confirmation
    fill_in "Name", with: @user.name
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    fill_in "Phone num", with: @user.phone_num
    fill_in "Pincode", with: @user.pincode
    fill_in "State", with: @user.state
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "City", with: @user.city
    fill_in "Email", with: @user.email
    fill_in "Email confirmation", with: @user.email_confirmation
    fill_in "Name", with: @user.name
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    fill_in "Phone num", with: @user.phone_num
    fill_in "Pincode", with: @user.pincode
    fill_in "State", with: @user.state
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end

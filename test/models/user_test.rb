require 'test_helper'
require 'bcrypt'


class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(prenom: "Example User", nom: "Example", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "Le prenom est invalde" do
    @user.prenom = "     "
    assert_not @user.valid?
  end

  test "Le nom est invalde" do
    @user.nom = "     "
    assert_not @user.valid?
  end

  test "Votre email est invalide" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "Votre prenom est trop long" do
  	@user.prenom = "a" * 51
  	assert_not @user.valid?
  end

  test "Votre nom est trop long" do
  	@user.nom = "a" * 51
  	assert_not @user.valid?
  end

  test "Votre email est trop long" do
  	@user.email = "a" * 244 + "@example.com"
  	assert_not @user.valid?
  end

    test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
   		 invalid_addresses.each do |invalid_address|
      		@user.email = invalid_address
      		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    	end
    end

    test "email unique ?" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end

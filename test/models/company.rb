require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  def setup
    @company = companies(:updated_attribute_fixtures)
  end

  test "Update wrong email domain" do
    @company.update(email: 'test@gmail.com') 
    assert_not @company.validate
    assert_equal @company.errors[:email].first, "email must be a getmainstreet.com account"
  end

  test "allow empty email" do
    @company.update(email: '') 
    assert @company.validate
  end

  test "Allow zip code updatin" do
    @company.update(zip_code: "93003")
    assert_equal @company.zip_code, "93003"
    assert @company.validate
    assert @company.city
    assert @company.state
  end
end
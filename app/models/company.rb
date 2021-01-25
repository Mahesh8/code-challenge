class Company < ApplicationRecord
  has_rich_text :description

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/
  EMAIL_ERROR_MESSAGE = "email must be a getmainstreet.com account"

  validates :email, format: { with: EMAIL_REGEX, message: EMAIL_ERROR_MESSAGE }, allow_blank: true

  before_save :add_city_and_state

  def add_city_and_state
    return if !zip_code
    zipcode_data = ZipCodes.identify(zip_code)
    self.city =  zipcode_data.present? ? zipcode_data[:city] : 'City'
    self.state = zipcode_data.present? ? zipcode_data[:state_name] : 'State'
  end
end

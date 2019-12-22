require 'rails_helper'

RSpec.describe Order, type: :model do
  # Association test
  # ensure an order record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure columns device_model, imei, annual_price are present before saving
  it { should validate_presence_of(:device_model) }
  it { should validate_presence_of(:imei) }
  it { should validate_presence_of(:annual_price) }
end

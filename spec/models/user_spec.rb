require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Order model
  it { should have_many(:orders).dependent(:destroy) }
  # Validation tests
  # ensure columns cpf and name are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_uniqueness_of(:cpf) }
end

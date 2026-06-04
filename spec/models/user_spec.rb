require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:role) }

  it "define enum of roles" do
    expect(described_class.roles).to eq(
      "employee" => 0,
      "manager" => 1,
      "admin" => 2
    )
  end
end

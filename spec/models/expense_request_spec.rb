require 'rails_helper'

RSpec.describe ExpenseRequest, type: :model do
  let(:user) do
    User.create!(
      name: "nagase",
      email: "test@mail.com",
      password: "123456",
      role: "employee",
    )
  end

  let(:expense_request) do
    described_class.new(
      user: user,
      title: "交通費",
      amount: 10000,
      spent_on: Date.new(2026, 4, 11),
      status: "submitted",
    )
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:spent_on) }
  it { is_expected.to validate_presence_of(:status) }

  it "define enum of status" do
    expect(described_class.statuses).to eq(
      "draft" => 0,
      "submitted" => 1,
      "approved" => 2,
      "returned" => 3
    )
  end

  it "amount should be greater than 0" do
    expense_request.amount = 0
    expense_request.valid?
    expect(expense_request.errors[:amount]).to include("must be greater than 0")
  end
end

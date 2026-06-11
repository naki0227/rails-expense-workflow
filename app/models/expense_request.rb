class ExpenseRequest < ApplicationRecord
  belongs_to :user

  enum :status, {
    draft: 0,
    submitted: 1,
    approved: 2,
    returned: 3
  }

  validates :title, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :spent_on, presence: true
  validates :status, presence: true
end

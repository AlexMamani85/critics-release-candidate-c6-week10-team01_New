class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :start_date, comparison: { less_than: Date.current }
end

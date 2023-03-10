class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :start_date, comparison: { less_than: Date.current }, allow_blank: true

  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies

  has_many :critics, as: :criticable, dependent: :destroy

  has_one_attached :cover
end

class Platform < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  has_and_belongs_to_many :games

  enum category: {
    console: 0,
    arcade: 1,
    platform: 2,
    operating_system: 3,
    portable_console: 4,
    computer: 5
  }
end

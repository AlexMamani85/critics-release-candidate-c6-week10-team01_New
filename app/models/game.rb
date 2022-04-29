class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :start_date, comparison: { less_than: Date.current }
  validates :rating,
            numericality: {
            greater_than_or_equal_to: 0,
            less_than_or_equal_to: 100,
            allow_nil: true
            }

  enum category: { main_game: 0, expansion: 1 }

  validate :validate_parent


  belongs_to :parent, class_name: "Game", optional: true

  private

  def validate_parent
    if category == "main_game" && parent_id
      errors.add(:parent_id, "Should be null")
    elsif category == "expansion" && Game.find_by(id: parent_id).nil?
      erros.add(:parent_id, "Should be a valid game id")
    end
  end
end

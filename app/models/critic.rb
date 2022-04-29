class Critic < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true

  belongs_to :criticable, polymorphic: true
  belongs_to :user
end

class Type < ApplicationRecord
  belongs_to :user
  has_many :spendings

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end

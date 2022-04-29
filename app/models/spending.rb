class Spending < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :type

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true
end

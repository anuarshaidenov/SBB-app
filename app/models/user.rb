class User < ApplicationRecord
  has_many :spendings, foreign_key: 'author_id'
  has_many :types
end

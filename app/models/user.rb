class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spendings, foreign_key: 'author_id', dependent: :destroy
  has_many :types, dependent: :destroy
  validates :name, presence: true, length: { maximum: 250 }
end

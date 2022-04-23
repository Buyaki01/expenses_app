class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :home_pages
  has_many :expenses, foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 1..100 }
end

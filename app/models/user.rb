class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, {presence: true, uniqueness: true}
  has_secure_password

  has_and_belongs_to_many :projects
  has_many :notes
  has_many :comments, through: :notes
end

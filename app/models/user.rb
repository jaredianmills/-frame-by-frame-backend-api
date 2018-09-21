class User < ApplicationRecord
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }


  has_and_belongs_to_many :projects
  has_many :notes, through: :projects
  has_many :comments, through: :notes
end

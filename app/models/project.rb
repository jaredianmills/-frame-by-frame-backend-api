class Project < ApplicationRecord
  validates :title, presence: true
  has_one_attached :video, dependent: :purge_later

  has_and_belongs_to_many :users
  has_many :notes
  has_many :comments, through: :notes
end

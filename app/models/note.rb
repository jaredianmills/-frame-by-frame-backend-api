class Note < ApplicationRecord
  validates :content, presence: true

  belongs_to :project
  belongs_to :user
  has_many :comments
end

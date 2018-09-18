class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :note
  has_one :project, through: :note
end

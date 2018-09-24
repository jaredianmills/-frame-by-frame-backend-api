class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :video_url, :video
  has_many :users, include_nested_associations: true
  has_many :notes, include_nested_associations: true
  # has_many :comments, include_nested_associations: true

  # def video_url
  #   byebug
  # end
end

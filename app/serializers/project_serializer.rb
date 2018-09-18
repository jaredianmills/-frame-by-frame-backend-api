class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :video_url
  has_many :users, include_nested_associations: true
  has_many :notes, include_nested_associations: true
  # has_many :comments, include_nested_associations: true
end

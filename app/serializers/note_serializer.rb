class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :timecode, :completed, :user, :project, :comments
  # has_many :comments, include_nested_associations: true
end

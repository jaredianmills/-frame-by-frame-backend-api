class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :note_id, :user
  belongs_to :note
end

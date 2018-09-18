class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :note_id
  belongs_to :note
end

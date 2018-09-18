class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password_digest
  has_many :projects, include_nested_associations: true
  has_many :notes, include_nested_associations: true
  attribute :comments
end

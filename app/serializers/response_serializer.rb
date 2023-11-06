class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :content, :votes
end

class ResponseSerializer < ActiveModel::Serializer
  attributes :pubId, :content, :votes
end

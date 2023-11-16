class PollSerializer < ActiveModel::Serializer
  attributes :pubId, :title, :created_utc, :exp_s
  has_many :responses

  def created_utc
    object.created_at.utc.iso8601
  end
end

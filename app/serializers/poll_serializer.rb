class PollSerializer < ActiveModel::Serializer
  attributes :pubId, :title, :seconds_since_creation, :exp_s
  has_many :responses

  def seconds_since_creation
    Time.now.to_i - Poll.first.created_at.to_i
  end
end

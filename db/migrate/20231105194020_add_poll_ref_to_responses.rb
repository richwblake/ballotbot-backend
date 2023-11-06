class AddPollRefToResponses < ActiveRecord::Migration[7.1]
  def change
    add_reference :responses, :poll, null: false, foreign_key: true
  end
end

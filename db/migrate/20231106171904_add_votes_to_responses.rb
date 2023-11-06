class AddVotesToResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :responses, :votes, :integer, default: 0
  end
end

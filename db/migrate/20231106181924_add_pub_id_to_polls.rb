class AddPubIdToPolls < ActiveRecord::Migration[7.1]
  def change
    add_column :polls, :pubId, :string
  end
end

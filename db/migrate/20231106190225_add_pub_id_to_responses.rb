class AddPubIdToResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :responses, :pubId, :string
  end
end

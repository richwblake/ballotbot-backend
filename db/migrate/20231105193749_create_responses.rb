class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.string :content

      t.timestamps
    end
  end
end

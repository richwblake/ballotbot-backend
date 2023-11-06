class AddExpirationToPolls < ActiveRecord::Migration[7.1]
  def change
    add_column :polls, :exp_s, :integer
  end
end

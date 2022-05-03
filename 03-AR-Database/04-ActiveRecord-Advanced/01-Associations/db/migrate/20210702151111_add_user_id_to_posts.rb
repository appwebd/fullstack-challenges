class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer, default: 0, null: false
  end
end

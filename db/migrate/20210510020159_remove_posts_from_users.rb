class RemovePostsFromUsers < ActiveRecord::Migration[5.1]
  def change
    if foreign_key_exists?(:posts, :users)
      remove_foreign_key :posts, :users
    end

    drop_table :follows
  end
end

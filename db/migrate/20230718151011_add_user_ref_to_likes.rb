class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, foreign_key: { to_table: 'users' }
    add_index :likes, :author_id, name: 'index_likes_on_author_id'
  end
end

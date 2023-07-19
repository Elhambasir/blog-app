class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, foreign_key: { to_table: 'users' } 
    add_index :posts, :author_id, name: 'index_posts_on_author_id'
  end
end

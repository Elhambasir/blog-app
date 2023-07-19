class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, foreign_key: { to_table: 'users' } 
    add_index :comments, :author_id, name: 'index_comments_on_author_id'
  end
end

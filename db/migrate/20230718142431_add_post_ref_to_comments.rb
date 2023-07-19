class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true
    add_index :comments, :post_id, name: 'index_comments_on_post_id'
  end
end

class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
    add_index :likes, :post_id, name: 'index_likes_on_post_id'
  end
end

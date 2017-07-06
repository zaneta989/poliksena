class Like < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user_id, foreign_key: true
      t.references :article_id, foreign_key: true
    end
  end
end

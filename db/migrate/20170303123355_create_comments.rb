class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.commenter :string
      t.body :text
      t.article :references
      t.timestamps
    end
  end
end

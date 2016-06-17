class CreateCommentings < ActiveRecord::Migration
  def change
    create_table :commentings do |t|
      t.references :comment, index: true
      t.references :commentable, polymorphic: true, index: true
      t.timestamps null:false
    end
    add_foreign_key :commentings, :comments
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.text :body

      t.timestamps null: false
    end
  end
end

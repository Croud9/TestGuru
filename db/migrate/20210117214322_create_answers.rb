class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.integer :question_id
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end

class AddColumnsToUserTests < ActiveRecord::Migration[6.1]
  def change
    change_table :user_tests do |t|
      t.references :current_question, foreign_key: { to_table: :questions  }
      t.integer :correct_questions, default: 0
    end
  end
end

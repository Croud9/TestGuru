class CreateTableBadgesUserTests < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_user_tests do |t|
      t.references :badge
      t.references :user_test
    end
  end
end

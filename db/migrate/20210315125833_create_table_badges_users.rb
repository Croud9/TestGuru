class CreateTableBadgesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :badges_users do |t|
      t.references :badge
      t.references :user
    end
  end
end

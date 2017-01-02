class CreateQLineups < ActiveRecord::Migration
  def change
    create_table :q_lineups do |t|
      t.string :suggestion_or_inspiration
      t.integer :inspiration_id
      t.integer :suggestion_id
      t.boolean :active
      t.integer :lineup_order
      t.integer :q_id

      t.timestamps

    end
  end
end

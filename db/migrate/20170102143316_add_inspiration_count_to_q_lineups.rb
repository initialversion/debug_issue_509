class AddInspirationCountToQLineups < ActiveRecord::Migration[5.0]
  def change
    add_column :q_lineups, :inspirations_count, :integer
  end
end

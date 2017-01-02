class AddSuggestionCountToQLineups < ActiveRecord::Migration[5.0]
  def change
    add_column :q_lineups, :suggestions_count, :integer
  end
end

class ModifyRankScoreValue < ActiveRecord::Migration
  def change
    change_column :rank_scores, :value,  :decimal
  end
end

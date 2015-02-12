class CreateRankScores < ActiveRecord::Migration
  def change
    create_table :rank_scores do |t|
      t.references  :rankable, polymorphic: true
      t.integer :value
    end
  end
end

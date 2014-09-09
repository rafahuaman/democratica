class CreateCongressMembers < ActiveRecord::Migration
  def change
    create_table :congress_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :state
      t.integer :district
      t.string :party
      t.string :twitter_handle

      t.timestamps
    end
  end
end

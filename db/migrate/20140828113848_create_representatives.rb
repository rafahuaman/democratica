class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :address
      t.string :city
      t.string :state
      t.string :zip4
      t.string :district
      t.string :party
      t.string :twitter_handle

      t.timestamps
    end
  end
end

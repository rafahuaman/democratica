class AddCongressionalDistrictToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :district, :integer
  end
end

class AddTypeToCongressMembers < ActiveRecord::Migration
  def change
    add_column :congress_members, :type, :string
  end
end

class RenameCongressMemberTypeToTypeByHouse < ActiveRecord::Migration
  def change
    rename_column :congress_members, :type, :type_by_house
  end
end

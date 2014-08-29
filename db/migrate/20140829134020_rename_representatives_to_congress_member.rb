class RenameRepresentativesToCongressMember < ActiveRecord::Migration
  def change
    rename_table :representatives, :congress_members
  end
end

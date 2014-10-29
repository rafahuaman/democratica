class AddAccessTokenAndAccessSecretToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :access_token, :string
    add_column :identities, :access_secret, :string
  end
end

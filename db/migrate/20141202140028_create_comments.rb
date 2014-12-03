class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :rally, index: true

      t.timestamps
    end
    add_index :comments, [:rally_id, :user_id, :created_at]
  end
end

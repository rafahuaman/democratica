class CreateRallies < ActiveRecord::Migration
  def change
    create_table :rallies do |t|
      t.string :title
      t.string :content
      t.string :twitter_template
      t.references :user, index: true

      t.timestamps
    end
  end
end

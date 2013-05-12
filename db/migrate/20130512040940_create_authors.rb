class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :login
      t.string :full_name
      t.string :gravatar_url

      t.timestamps
    end
  end
end

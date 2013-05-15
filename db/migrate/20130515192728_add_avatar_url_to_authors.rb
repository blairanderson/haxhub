class AddAvatarUrlToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :avatar_url, :string
    remove_column :authors, :gravatar_url
  end
end

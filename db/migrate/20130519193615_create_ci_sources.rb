class CreateCiSources < ActiveRecord::Migration
  def change
    create_table :ci_sources do |t|
      t.string :name
      t.string :owner
      t.boolean :active

      t.timestamps
    end
  end
end

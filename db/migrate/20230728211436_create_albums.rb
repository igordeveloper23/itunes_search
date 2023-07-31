class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :collection_id
      t.boolean :is_favorite

      t.timestamps
    end
  end
end

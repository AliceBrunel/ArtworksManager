class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
		t.string :title
		t.belongs_to :artist
		t.decimal :price
		t.string :technic
		t.belongs_to :user

      t.timestamps
    end
  end
end

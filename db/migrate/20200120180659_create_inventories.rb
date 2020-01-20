class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
		t.belongs_to :collection
		t.belongs_to :artwork

		t.timestamps
    end
  end
end

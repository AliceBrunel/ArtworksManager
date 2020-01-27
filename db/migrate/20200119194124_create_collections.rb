class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
		t.string :name
		t.string :description
		t.date :start_date
		t.date :end_date
		t.belongs_to :museum

      t.timestamps
    end
  end
end
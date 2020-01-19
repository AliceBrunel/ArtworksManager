class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
		t.string :name
		t.string :description
		t.belongs_to :museum
		t.date :start_date
		t.date :end_date

      t.timestamps
    end
  end
end

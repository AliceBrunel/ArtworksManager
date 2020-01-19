class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
		t.string :name
		t.integer :status_number
		t.string :attachment
		t.string :confirmation

      t.timestamps
    end
  end
end

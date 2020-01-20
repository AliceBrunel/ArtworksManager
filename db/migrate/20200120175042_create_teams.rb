class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
		t.belongs_to :user
		t.belongs_to :museum

		t.timestamps
    end
  end
end

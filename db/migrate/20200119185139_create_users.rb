class CreateUsers < ActiveRecord::Migration[6.0]
	def change
		create_table :users do |t|
			t.string :name 
			t.string :surname
			t.string :email
			t.string :address
			t.integer :phone
			t.string :position

			t.string :password_digest

			t.timestamps
		end
	end
end

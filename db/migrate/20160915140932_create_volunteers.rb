class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.integer :tel
      t.string :email

      t.timestamps
    end
  end
end

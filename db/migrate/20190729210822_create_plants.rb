class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.date :start_date
      t.integer :picture_reminder
      t.integer :water_reminder
      t.boolean :public
      t.boolean :needs_processing, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

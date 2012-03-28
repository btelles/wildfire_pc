class CreateSuspensions < ActiveRecord::Migration
  def change
    create_table :suspensions do |t|
      t.string :name
      t.integer :bicycle_id

      t.timestamps
    end
  end
end

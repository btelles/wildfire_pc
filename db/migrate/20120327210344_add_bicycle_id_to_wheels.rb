class AddBicycleIdToWheels < ActiveRecord::Migration
  def change
    add_column :wheels, :bicycle_id, :integer
  end
end

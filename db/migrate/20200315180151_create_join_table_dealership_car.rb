class CreateJoinTableDealershipCar < ActiveRecord::Migration[6.0]
  def change
    create_join_table :dealerships, :cars do |t|
    end
  end
end

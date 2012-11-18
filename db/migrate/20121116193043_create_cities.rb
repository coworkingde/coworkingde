class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :permalink
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end

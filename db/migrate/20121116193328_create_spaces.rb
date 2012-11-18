class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :city_id
      t.string :name
      t.string :url
      t.string :email
      t.string :street
      t.string :city_name
      t.string :zip
      t.string :twitter
      t.string :facebook
      t.string :permalink
      t.decimal :lat
      t.decimal :lng
      t.text :description
      t.text :infrastructure
      t.string :color
      t.published :boolean

      t.timestamps
    end
  end
end

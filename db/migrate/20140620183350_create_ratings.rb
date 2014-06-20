class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :whiskey_id
      t.integer :person_id
      t.integer :nose
      t.integer :taste
      t.integer :finish
      t.integer :balance
      t.text :review

      t.timestamps
    end
  end
end

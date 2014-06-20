class CreateWhiskeys < ActiveRecord::Migration
  def change
    create_table :whiskeys do |t|
      t.string :type
      t.string :tags
      t.string :distillery
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end

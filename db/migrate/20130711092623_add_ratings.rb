class AddRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.belongs_to :post, null: false
      t.timestamps
    end
  end
end

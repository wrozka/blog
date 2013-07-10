class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :text, null: false
      t.belongs_to :post, null: false
      t.timestamps
    end
  end
end

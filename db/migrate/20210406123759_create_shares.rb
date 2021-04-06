class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|

      t.string :title,              null: false
      t.text :share,                null: false
      t.references :user,          foreign_key:true

      t.timestamps
    end
  end
end

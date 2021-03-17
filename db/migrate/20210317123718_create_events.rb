class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :guests_number
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end

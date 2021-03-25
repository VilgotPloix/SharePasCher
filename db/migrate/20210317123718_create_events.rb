class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.integer :guests_number
      t.integer :current_guests
      t.belongs_to :city, index: true
      t.belongs_to :user, index: true
      t.references :host, index: true,foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

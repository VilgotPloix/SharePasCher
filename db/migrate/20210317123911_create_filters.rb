class CreateFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :filters do |t|
      t.belongs_to :event, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end

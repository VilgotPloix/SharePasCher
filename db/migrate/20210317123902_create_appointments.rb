class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.boolean :is_accepted, default: false
      

      t.timestamps
    end
  end
end

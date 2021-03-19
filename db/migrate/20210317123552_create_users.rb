class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_day
      t.integer :age
      t.string :gender
      t.boolean :is_host
      

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirm
      t.boolean :is_admin


      t.timestamps
    end
  end
end

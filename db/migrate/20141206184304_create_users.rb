class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :goals
      t.string :location
      t.string :user_name

      t.timestamps
    end
  end
end

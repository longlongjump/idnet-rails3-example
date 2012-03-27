class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.timestamps
    end
  end
end

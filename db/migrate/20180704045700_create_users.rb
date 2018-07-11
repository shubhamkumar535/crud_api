class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :phone
      t.boolean :verified
      t.string :otp

      t.timestamps
    end
  end
end

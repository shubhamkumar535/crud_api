class CreateStaticContents < ActiveRecord::Migration[5.1]
  def change
    create_table :static_contents do |t|
       t.string :sname
       t.string :scontent
      t.timestamps
    end
  end
end

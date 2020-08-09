class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :age
      t.string :nationality

      t.timestamps
    end
  end
end

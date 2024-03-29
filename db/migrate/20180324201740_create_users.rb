class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false
      t.string :password_digest,    null: false
      t.integer :role,              default: 0
      t.string :firstname,          null: false
      t.string :lastname
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps
    end
  end
end

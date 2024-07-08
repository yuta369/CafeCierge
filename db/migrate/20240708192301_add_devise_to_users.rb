class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      unless column_exists? :users, :email
        t.string :email, null: false, default: ""
      end

      unless column_exists? :users, :encrypted_password
        t.string :encrypted_password, null: false, default: ""
      end

      ## Recoverable
      unless column_exists? :users, :reset_password_token
        t.string :reset_password_token
      end

      unless column_exists? :users, :reset_password_sent_at
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists? :users, :remember_created_at
        t.datetime :remember_created_at
      end

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :users, :email, unique: true unless index_exists? :users, :email
    add_index :users, :reset_password_token, unique: true unless index_exists? :users, :reset_password_token
    # add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

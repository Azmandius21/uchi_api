class CreateUserTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end

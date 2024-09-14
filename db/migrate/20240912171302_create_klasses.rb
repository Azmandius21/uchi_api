class CreateKlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :klasses do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.integer :students_count, dafault: 0
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :surname
      t.references :school, null: false, foreign_key: true
      t.references :klass, null: false, foreign_key: true

      t.timestamps
    end
  end
end

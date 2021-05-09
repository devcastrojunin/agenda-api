class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :nome
      t.string :email
      t.boolean :status
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMatters < ActiveRecord::Migration[6.1]
  def change
    create_table :matters do |t|
      t.string :nome
      t.boolean :status

      t.timestamps
    end
  end
end

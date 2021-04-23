class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :idade
      t.string :email
      t.string :cpf
      t.string :rg
      t.string :data_nascimento
      
      t.timestamps
    end
  end
end

class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.text :nome
      t.text :email
      t.boolean :acesso
      t.boolean :admin

      t.timestamps
    end
  end
end

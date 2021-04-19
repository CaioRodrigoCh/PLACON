class AddAcessoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :acesso, :boolean
  end
end

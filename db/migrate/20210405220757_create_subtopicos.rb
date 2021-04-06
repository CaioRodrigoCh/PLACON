class CreateSubtopicos < ActiveRecord::Migration[5.2]
  def change
    create_table :subtopicos do |t|
      t.string :titulo
      t.references :topico, foreign_key: true

      t.timestamps
    end
  end
end

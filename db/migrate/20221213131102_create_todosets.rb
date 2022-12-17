class CreateTodosets < ActiveRecord::Migration[7.0]
  def change
    create_table :todosets do |t|
      t.string :name
      # t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

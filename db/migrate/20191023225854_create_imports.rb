# frozen_string_literal: true

class CreateImports < ActiveRecord::Migration[5.2]
  def change
    create_table :imports do |t|
      t.string :title
      t.string :file
      t.integer :inv_users
      t.string :status

      t.timestamps
    end
  end
end

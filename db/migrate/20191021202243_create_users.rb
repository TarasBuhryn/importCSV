# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :import_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth

      t.timestamps
    end
  end
end

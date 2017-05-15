class CreateCases < ActiveRecord::Migration[5.0]
  def change
     create_table :cases do |t|
      t.string :name,  { null: false }
      t.date :date_decided,  { null: false }
      t.string :cite1,  { null: false }
      t.string :cite2
      t.integer :issue_id
      t.timestamps
    end
  end
end

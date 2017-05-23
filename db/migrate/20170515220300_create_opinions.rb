class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.string :opinion_type, default: "majority"
      t.integer :case_id
      t.integer :justice_id
      t.timestamps
    end
  end
end

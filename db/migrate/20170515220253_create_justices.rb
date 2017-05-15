class CreateJustices < ActiveRecord::Migration[5.0]
  def change
    create_table :justices do |t|

      t.timestamps
    end
  end
end

class IssuesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :issues_users do |t|
      t.integer :user_id
      t.integer :issue_id
      t.timestamps
    end
  end
end

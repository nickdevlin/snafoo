class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :employee_id
      t.integer :snack_id

      t.timestamps
    end
  end
end

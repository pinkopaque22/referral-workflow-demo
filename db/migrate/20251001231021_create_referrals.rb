class CreateReferrals < ActiveRecord::Migration[8.0]
  def change
    create_table :referrals do |t|
      t.string :student_name
      t.text :student_info
      t.string :status

      t.bigint :teacher_id, null: false
      t.bigint :counselor_id, null: false
      t.bigint :admin_id, null: false

      t.timestamps
    end

    add_foreign_key :referrals, :users, column: :teacher_id
    add_foreign_key :referrals, :users, column: :counselor_id
    add_foreign_key :referrals, :users, column: :admin_id
  end
end

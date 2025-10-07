class AddDefaultStatusToReferrals < ActiveRecord::Migration[8.0]
  def change
    # Ensure the column exists as a string
    change_column :referrals, :status, :string, default: "pending_admin_review", null: false
  end
end

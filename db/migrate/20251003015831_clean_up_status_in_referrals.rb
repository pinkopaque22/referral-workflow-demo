class CleanUpStatusInReferrals < ActiveRecord::Migration[8.0]
  def change
    # Remove any old integer columns used for status
    remove_column :referrals, :status_test, :integer if column_exists?(:referrals, :status_test)

    # Ensure status column is string with default
    change_column :referrals, :status, :string, default: "pending_admin_review", null: false
  end
end

class RemoveStatusTestFromReferrals < ActiveRecord::Migration[8.0]
  def change
    remove_column :referrals, :status_test, :integer
  end
end

class AddFieldsToReferrals < ActiveRecord::Migration[8.0]
  def change
    add_column :referrals, :counselor_notes, :text
    add_column :referrals, :admin_signature, :string
  end
end

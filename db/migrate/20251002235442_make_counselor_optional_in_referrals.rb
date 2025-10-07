class MakeCounselorOptionalInReferrals < ActiveRecord::Migration[8.0]
  def change
    change_column_null :referrals, :counselor_id, true
    change_column_null :referrals, :admin_id, true
  end
end

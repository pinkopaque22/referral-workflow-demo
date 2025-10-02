class User < ApplicationRecord
  has_many :submitted_referrals, class_name: 'Referral', foreign_key: 'teacher_id'
  has_many :assigned_referrals, class_name:  'Referral', foreign_key: 'counselor_id'
  has_many :admin_referrals, class_name: 'Referral', foreign_key: 'admin_id'
end

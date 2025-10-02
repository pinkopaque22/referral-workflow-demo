json.extract! referral, :id, : student_name, : student_info, : status, : teacher_id, : counselor_id, : admin_id, :created_at, :updated_at
json.url referral_url(referral, format: :json)

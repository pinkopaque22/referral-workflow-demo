# Clear old data (order matters because of foreign keys)
Referral.destroy_all if defined?(Referral)
User.destroy_all if defined?(User)

# Create Users
teacher   = User.create!(name: "Ms. Ramirez", email: "teacher@example.com", role: "teacher")
counselor = User.create!(name: "Mr. Lee", email: "counselor@example.com", role: "counselor")
admin     = User.create!(name: "Dr. Johnson", email: "admin@example.com", role: "admin")

# Create Referrals with compassionate student info
Referral.create!(
  student_name: "Johnny Doe",
  student_info: "Struggling with attendance and appears withdrawn in class. Needs supportive counseling.",
  status: "submitted",
  teacher: teacher,
  counselor: counselor,
  admin: admin
)

Referral.create!(
  student_name: "Maria Lanez",
  student_info: "Frequently anxious during group activities. Teacher is concerned about her ability to focus.",
  status: "approved",
  teacher: teacher,
  counselor: counselor,
  admin: admin
)

Referral.create!(
  student_name: "David Nelson",
  student_info: "Family recently experienced housing instability. Student is showing signs of stress.",
  status: "in_progress",
  teacher: teacher,
  counselor: counselor,
  admin: admin
)

Referral.create!(
  student_name: "Alycia Brown",
  student_info: "Student shared feelings of sadness and isolation. Teacher recommends connecting with a counselor.",
  status: "closed",
  teacher: teacher,
  counselor: counselor,
  admin: admin
)

puts "🌱 Seeded #{User.count} users and #{Referral.count} referrals."

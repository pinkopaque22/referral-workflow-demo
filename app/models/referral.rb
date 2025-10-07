#class Referral < ApplicationRecord
  #belongs_to :teacher, class_name: "User"
  #belongs_to :counselor, class_name: "User", optional: true
  #belongs_to :admin, class_name: "User", optional: true

  # Rails 7+ enum syntax
  #enum :status, {
    #pending_admin_review: 0,
    #rejected: 1,
    #approved_pending_counselor: 2,
    #in_progress: 3,
    #closed: 4
  #}
#end
class Referral < ApplicationRecord
  enum :status, {
    pending_admin_review: "pending_admin_review",
    rejected: "rejected",
    approved_pending_counselor: "approved_pending_counselor",
    in_progress: "in_progress",
    closed: "closed"
  }, prefix: true  # ✅ Rails 8 syntax

  belongs_to :teacher, class_name: "User"
  belongs_to :counselor, class_name: "User", optional: true
  belongs_to :admin, class_name: "User", optional: true
end

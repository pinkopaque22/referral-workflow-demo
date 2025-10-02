class Referral < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  belongs_to :counselor, class_name: 'User'
  belongs_to :admin, class_name: 'User'

  # Default status could be "submitted"
  after_initialize :set_default_status, if: :new_record?

  def set_default_status
    self.status ||= "submitted"
  end
end

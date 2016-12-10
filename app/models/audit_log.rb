class AuditLog < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :status, :start_date, :user_id
end

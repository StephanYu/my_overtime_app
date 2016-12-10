require 'rails_helper'

describe 'AuditLog' do
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:user_id) }

  it 'has a default start date that commences 6 days prior ' do 
    user = create :user
    audit_log = AuditLog.create(user_id: user, start_date: nil)
    
    expect(audit_log.start_date).to eq(Date.today - 6.days)
  end
end

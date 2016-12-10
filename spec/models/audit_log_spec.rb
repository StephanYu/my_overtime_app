require 'rails_helper'

describe 'AuditLog' do
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:user_id) }
end

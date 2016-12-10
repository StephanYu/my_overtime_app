require 'rails_helper'

feature 'Audit Logs' do 
  scenario 'admin user navigates to index page' do 
    login_as_admin_user
    visit root_path
    click_on('Audit Log')

    expect(current_path).to eq(audit_logs_path)
  end

  scenario 'admin user sees content' do 
    create_audit_log
    login_as_admin_user
    visit audit_logs_path

    expect(page).to have_content(/SNOW/)
  end

  scenario 'non-admin user cannot view audit logs page' do 
    login_as_regular_user
    visit audit_logs_path

    expect(current_path).to eq(root_path)
  end

  def login_as_admin_user 
    admin_user = create :admin_user
    login_as(admin_user)
  end

  def login_as_regular_user 
    regular_user = create :user
    login_as(regular_user)
  end

  def create_audit_log 
    user = create :user
    audit_log = create :audit_log, user: user
  end
end
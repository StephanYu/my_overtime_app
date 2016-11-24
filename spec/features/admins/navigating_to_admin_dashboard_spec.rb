require 'rails_helper'

feature 'Admin Dashboard' do 
  scenario 'non-signed in users are unable to access' do 
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'non-admin users are unable to access' do 
    regular_user = create(:user)
    login_as(regular_user)
    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  scenario 'admin users are able to access' do 
    admin_user = create(:admin_user)
    login_as(admin_user)
    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end
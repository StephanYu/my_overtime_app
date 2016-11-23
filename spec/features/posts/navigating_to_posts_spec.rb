require 'rails_helper'

feature 'Navigate to Post index page' do 
  before do 
    @user = User.create(first_name: "User", last_name: "Test", email: "email@test.com", password: "123456", password_confirmation: "123456")
    login_as(@user)
  end
  
  scenario 'it can be reached successfully' do 
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  scenario 'it has a title of Posts' do 
    visit posts_path
    expect(page).to have_content(/Posts/)
  end
end
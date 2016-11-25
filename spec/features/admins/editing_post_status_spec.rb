require 'rails_helper'

feature 'Editing Post status via form' do 
  before do 
    @post = create(:post)
  end

  scenario 'admin user sets post status to approved' do 
    @admin_user = create(:admin_user)
    login_as(@admin_user)

    visit edit_post_path(@post)

    choose('post_status_approved')
    click_on('Save')

    expect(@post.reload.status).to eq('approved')
  end

  scenario 'non-admin user cannot see the status radio buttons' do 
    @regular_user = create(:user)
    login_as(@regular_user)

    visit edit_post_path(@post)

    expect(page).not_to have_content('Approved')
  end
end
require 'rails_helper'

feature 'Editing Post status via form' do 
  before do 
    @admin_user = create(:admin_user)
    @post = create(:post)
    login_as(@admin_user)
  end

  scenario 'post is approved by setting its status to approved' do 
    visit edit_post_path(@post)

    choose('post_status_approved')
    click_on('Save')

    expect(@post.reload.status).to eq('approved')
  end
end
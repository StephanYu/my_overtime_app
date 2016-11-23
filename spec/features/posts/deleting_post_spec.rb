require 'rails_helper'

feature 'Delete a post' do 
  before do 
    @user = create(:user)
    @post = create(:post, user: @user)
    login_as(@user)
  end
  scenario 'clicking the delete button is successful' do 
    visit posts_path
    expect(page).to have_content(@post.rationale)
    click_link("delete_post_#{@post.id}")

    expect(page).not_to have_content(@post.rationale)
  end
end
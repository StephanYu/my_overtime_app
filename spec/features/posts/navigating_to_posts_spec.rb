require 'rails_helper'

feature 'Navigate to Post index page' do 
  before do 
    @user = create(:user)
    login_as(@user)
  end
  
  scenario 'page can be reached successfully' do 
    visit posts_path
    expect(page.status_code).to eq(200)
  end

  scenario 'page has a title of Posts' do 
    visit posts_path
    expect(page).to have_content(/Posts/)
  end

  scenario 'user sees a list of posts' do 
    post = create(:post, user: @user)
    second_post = create(:second_post, user: @user)
    visit posts_path
    expect(page).to have_content(post.rationale)
    expect(page).to have_content(second_post.rationale)
  end

  scenario 'user can only see own posts and not others' do 
    other_user = create(:user)
    other_user_post = create(:post, user: other_user)

    visit posts_path

    expect(page).not_to have_content(other_user_post.rationale)
  end
end
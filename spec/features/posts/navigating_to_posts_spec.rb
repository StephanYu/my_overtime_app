require 'rails_helper'

feature 'Navigate to Post index page' do 
  before do 
    @user = create(:user)
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

  scenario 'it has a list of posts' do 
    post = create(:post)
    second_post = create(:second_post)
    visit posts_path
    expect(page).to have_content(post.rationale)
    expect(page).to have_content(second_post.rationale)
  end
end
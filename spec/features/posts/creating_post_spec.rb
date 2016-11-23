require 'rails_helper'

feature 'Create a new post' do 
  before do 
    @user = create(:user)
    login_as(@user)
  end

  scenario 'clicking the new post link is successful' do 
    visit root_path

    click_link('new_post')
    expect(current_path).to eq(new_post_path)
  end

  scenario 'the new form can be reached' do 
    visit new_post_path

    expect(page.status_code).to eq(200)
  end

  scenario 'the post can be created from the form' do 
    visit new_post_path

    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: 'A test post'
    click_on 'Save'

    expect(page).to have_content('A test post')
  end

  scenario 'the post has a user associated with it' do 
    visit new_post_path

    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: 'A test post'
    click_on 'Save'

    created_post = @user.posts.last

    expect(created_post.rationale).to eq('A test post')
  end
end
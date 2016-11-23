require 'rails_helper'

feature 'Editing a Post' do 
  before do 
    @user = create(:user)
    @post = create(:post, user: @user)
    login_as(@user)
  end

  scenario 'clicking the edit link of a post is successful' do 
    visit posts_path

    click_link("edit_#{@post.id}")
   
    expect(current_path).to eq(edit_post_path(@post))
  end

  scenario 'the post is being updated' do 
    visit edit_post_path(@post)

    fill_in 'post[date]', with: @post.date
    fill_in 'post[rationale]', with: @post.rationale
    click_on "Save"

    expect(page).to have_content(@post.rationale)
  end
end
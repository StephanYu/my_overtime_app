require 'rails_helper'

feature 'Editing a Post' do 
  before do 
    @user = create(:user)
    @post = create(:post, user: @user)
  end

  scenario 'clicking the edit link of a post is successful' do 
    login_as(@user)
    visit posts_path

    click_link("edit_#{@post.id}")
   
    expect(current_path).to eq(edit_post_path(@post))
  end

  scenario 'the post is being updated' do 
    login_as(@user)
    visit edit_post_path(@post)

    fill_in 'post[date]', with: @post.date
    fill_in 'post[rationale]', with: @post.rationale
    click_on "Save"

    expect(page).to have_content(@post.rationale)
  end

  scenario 'the post cannot be edited by a non-authorized user' do 
    non_authorized_user = create(:non_authorized_user)
    login_as(non_authorized_user)
    visit edit_post_path(@post)

    expect(current_path).to eq(root_path)
  end
end
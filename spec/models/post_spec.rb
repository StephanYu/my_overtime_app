require 'rails_helper'

describe 'Post' do
  describe 'creation' do
    before do 
      @user = User.create(first_name: "User", last_name: "Test", email: "email@test.com", password: "123456", password_confirmation: "123456")
      login_as(@user)
    end

    context 'with valid inputs' do 
      it 'saves the post' do 
        create_valid_post
        expect(@post).to be_valid      
      end
    end 

    context 'with invalid inputs' do 
      it 'does not save the post' do
        create_invalid_post
        expect(@post).not_to be_valid
      end
    end

    def create_valid_post
      @post = Post.create(date: Date.today, rationale: 'A test post', user: @user)
    end

    def create_invalid_post
      @post = Post.create(date: '', rationale: '', user: @user)
    end
  end
end

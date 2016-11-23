require 'rails_helper'

describe 'Post' do
  describe 'creation' do
    before do 
      @user = create(:user)
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
      @post = create(:post)
    end

    def create_invalid_post
      @post = create(:post)
      @post.date = ""
      @post.rationale = ""
    end
  end
end

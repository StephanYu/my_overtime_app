require 'rails_helper'

describe 'Post' do
  describe 'creation' do
    context 'with valid credentials' do 
      it 'saves the post' do 
        create_valid_post
        expect(@post).to be_valid      
      end
    end 

    context 'with invalid credentials' do 
      it 'does not save the post' do
        create_invalid_post
        expect(@post).not_to be_valid
      end
    end

    def create_valid_post
      @post = Post.create(date: Date.today, rationale: 'A test post')
    end

    def create_invalid_post
      @post = Post.create(date: '', rationale: '')
    end
  end
end

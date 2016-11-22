require 'rails_helper'

describe 'User' do
  describe 'creation' do
    context 'with valid credentials' do 
      it 'saves the user' do 
        create_valid_user
        expect(@user).to be_valid      
      end
    end 

    context 'with invalid credentials' do 
      it 'does not save the user' do
        create_invalid_user
        expect(@user).not_to be_valid
      end
    end

    def create_valid_user
      @user = User.create(first_name: 'Adam', last_name: 'Test', email: 'adam@test.com', password: '123456', password_confirmation: '123456')
    end

    def create_invalid_user
      @user = User.create(first_name: '', last_name: '', email: 'nil@test.com', password: '123456', password_confirmation: '123456')
    end
  end
end

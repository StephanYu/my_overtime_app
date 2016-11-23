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
  end

  describe '#full_name' do 
    it 'combines the users first_name and last_name in uppercase' do 
      create_valid_user
      user_full_name = "#{@user.last_name.upcase}, #{@user.first_name.upcase}"
      expect(@user.full_name).to eq(user_full_name)
    end
  end

  def create_valid_user
    @user = create(:user)
  end

  def create_invalid_user
    @user = create(:user)
    @user.first_name = ""
    @user.last_name = ""
  end
end

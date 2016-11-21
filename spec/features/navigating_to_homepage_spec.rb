require 'rails_helper'

feature 'Navigating to the homepage' do 
  scenario 'it can be successfully reached' do 
    visit root_path

    expect(page.status_code).to eq(200) 
  end
end
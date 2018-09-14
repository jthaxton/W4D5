require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end
  
  scenario 'has a new user page' do 
    expect(page).to have_content 'Sign Up'
  end 
  
  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in('password', with: '123456')
      fill_in('username', with: '123456')
      click_button('Sign Up')
      
      expect(page).to have_content('123456')
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_path
    fill_in('password', with: 'joe')
    fill_in('username', with: 'joejoe')
    click_button('Log In')
    
    expect(page).to have_content('joe')
  end 
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
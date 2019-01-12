require 'rails_helper'

feature 'New user sign up' do
  
  scenario 'New User Registration' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@example.org'
    fill_in 'Password', with: 'very-secret'
    fill_in 'Password confirmation', with: 'very-secret'
    click_on 'Sign up'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
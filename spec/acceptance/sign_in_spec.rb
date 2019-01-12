require 'rails_helper'

feature 'User sign in' do
  let(:user) { create(:user) }

  scenario 'Registered user try to sigin in' do
    visit '/admin/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(current_path).to eq '/admin/'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Non-Registered user try to sigin in' do
    visit '/admin/'
    fill_in 'Email', with: 'random@example.org'
    fill_in 'Password', with: 'random-secret'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq '/users/sign_in'
  end
end
require 'rails_helper'

feature 'Post management' do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    sign_in_user(user)
  end

  scenario 'Create Post' do
	  visit new_post_path
	  attach_file('Post photo', Rails.root.join('spec', 'fixtures', 'files', 'profile.jpeg'))
    fill_in 'Title', with: post.title
    fill_in 'Body', with: post.body
    click_on 'Create Post'

    expect(page).to have_content("Создано")
  end
  
  scenario 'Edit Post' do
    visit "/posts/#{post.id}/edit"
    fill_in 'Body', with: 'New Body Text'
    click_on 'Update Post'

    expect(page).to have_content("New Body Text")
  end

  scenario 'Delete Post' do
    visit "/posts/#{post.id}"
    click_on 'Удалить'

    expect(current_path).to eq root_path
  end
end
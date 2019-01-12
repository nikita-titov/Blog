require 'rails_helper'

feature 'Comments management' do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    sign_in_user(user)
    create_comment
  end

  scenario 'Create comment' do
    expect(page).to have_content("less than a minute Ago")
    expect(page).to have_content("Test Name")
  end

  scenario 'Delete comment' do
  	click_on 'Удалить комментарий'
  	expect(page).to have_content("0 Комментарий")
  end
end
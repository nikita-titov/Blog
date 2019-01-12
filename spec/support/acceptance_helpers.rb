module AcceptanceHelpers
  def sign_in_user(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def create_comment
    visit "/posts/#{post.id}"
    fill_in 'Name', with: 'Test Name'
    fill_in 'Body', with: 'Coment Text Text'
    click_on 'Create Comment'
  end
end
module ControllerMacros
  def sign_in_user
    let!(:user) { create(:user) }
    before { subject.stub(current_user: user, authenticate_user!: true) }
  end
end
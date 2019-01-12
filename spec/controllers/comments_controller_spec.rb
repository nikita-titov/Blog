require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe 'GET #create' do
  	sign_in_user
    let!(:post) { create(:post) }

    it 'create comment' do
      expect{ create(:comment, post_id: post.id) }.to change{Comment.count}.by(1)
	  end
  end

  describe 'GET #delete' do
    sign_in_user
    let!(:post) { create(:post) }
    let!(:comment) { create(:comment, post_id: post.id)}

    it 'delete comment' do
      expect{ delete(:destroy, params: { id: comment.id, post_id: post.id }) }.to change{Comment.count}.by(-1)
	  end
  end
end
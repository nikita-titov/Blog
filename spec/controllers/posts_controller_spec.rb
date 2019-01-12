require 'rails_helper'

RSpec.describe PostsController, type: :controller do
 
  describe 'GET #create' do
    sign_in_user
    it 'create post' do
      expect{Post.create(build :post_params)}.to change{Post.count}.by(1)
	  end

	  it 'render index view' do
	    get :index
      expect(response).to have_http_status(200)
	    expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }
    it 'render show view' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'POST #update' do
    sign_in_user
    let(:post) { create(:post) }

    it 'should update record' do
      patch :update, params: { id: post.id, post: { title: "updated title" } }
      post.reload
      expect(post.title).to eq("updated title")
    end 

    it 'render update view' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    sign_in_user
    let!(:post) { create(:post) }
    let!(:comment) { create(:comment, post_id: post.id)}

    it 'deletes post' do
      expect{ delete :destroy, params: { id: post.id } }.to change{Post.count}.by(-1)
    end  

    it 'deletes associated comments' do
      expect{ delete :destroy, params: { id: post.id } }.to change{Comment.count}.by(-1)
    end  
  end
end
require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validate' do	
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
    it { should validate_presence_of :post_photo}
  end

  context 'associations' do
   it { should have_many(:comments) }
 end
end
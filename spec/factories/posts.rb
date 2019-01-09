FactoryBot.define do
  factory :post do
    title  { 'Simple title' }
    body { 'Body text' }
    post_photo { File.open(Rails.root.join("spec", "fixtures", "files", "profile.jpeg")) }
  end

  factory :user do 
   email { 'test@example.org' }
   password { 'very-secret' }
  end

  factory :comment do 
   name { 'Test Name' }
   body { 'Simple text' }
  end

  factory :post_params, class:Hash do
    params = {
      title: 'Simple title',
      body: 'Body text',
      post_photo: File.open(Rails.root.join("spec", "fixtures", "files", "profile.jpeg"))
    }
    initialize_with{ params.merge(attributes) }
  end
end
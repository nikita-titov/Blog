FactoryBot.define do
  factory :post_params, class:Hash do
    params = {
      title: 'Simple title',
      body: 'Body text',
      post_photo: File.open(Rails.root.join("spec", "fixtures", "files", "profile.jpeg"))
    }
    initialize_with{ params.merge(attributes) }
  end
end
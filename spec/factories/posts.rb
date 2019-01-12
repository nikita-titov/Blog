FactoryBot.define do
  factory :post do
    title  { 'Simple title' }
    body { 'Body text' }
    post_photo { File.open(Rails.root.join("spec", "fixtures", "files", "profile.jpeg")) }
  end
end
FactoryBot.define do
  factory :company do
    name 'name'
    slug 'slug'
    logo_url 'url'
    description 'description'
    country 1
    website 'http://www.website.com'
    game
    publisher
    developer
  end
end

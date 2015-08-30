FactoryGirl.define do
  factory :page, class: Spree::Cms::Page do
    title 'Static Page'
    url 'static_page'
  end
end
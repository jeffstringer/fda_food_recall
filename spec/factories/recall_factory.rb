require 'faker'

FactoryGirl.define do
  factory :recall do
    product_description { Faker::Space.agency }
    reason { Faker::Space.nebula } 
    company_release_link { Faker::Internet.url('example.com') }
    release_date { Faker::Date.between(2.days.ago, Date.today) }
  end
end
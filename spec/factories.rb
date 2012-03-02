FactoryGirl.define do
  factory :deal do
  end

  sequence :key do |n|
    "some_key_#{n}"
  end

  factory :custom_field do
    account_id 1
    fieldable_type 'Deal'
    fieldable_id 1
    key
  end
end

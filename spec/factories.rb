FactoryGirl.define do
  factory :user do
    name 'some user'
    email 'user@gmail.com'
    is_admin false
  end

  factory :category do
    name 'geography'
  end

  factory :question do
    text 'what\'s up?'
  end

  factory :answer do
    text 'the answer'
  end
end

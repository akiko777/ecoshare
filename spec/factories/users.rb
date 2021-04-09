FactoryBot.define do

  factory :user do
    nickname               {"まい"}
    email                  {Faker::Internet.free_email}
    password               {"000000f"}
    password_confirmation  {"000000f"}
    profile                {"エコ活動"}
  end
end
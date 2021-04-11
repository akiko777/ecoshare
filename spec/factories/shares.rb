FactoryBot.define do

  factory :share do
    title               {'テストタイトル'}
    share               {'エコ活動頑張ろう'}
    association :user

    after(:build) do |share|
      share.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

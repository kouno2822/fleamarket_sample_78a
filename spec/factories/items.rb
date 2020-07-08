FactoryBot.define do

  factory :item do
    name {"Tシャツ"}
    brand {"adidas"}
    explanation {"Mサイズです。"}
    status {"新品、未使用"}
    sell_or_sold {"出品中"}
    delivery_burden {"送料込み（出品者負担）"}
    prefecture_id {"1"}
    delivery_day {"1~2日で発送"}
    price {"1000"}
    user_id {"1"}
    category_id {"202"}

    after(:build) do |item|
      item.images << build(:image, item: item)
    end  

  end

  factory :image do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/logo.png"), 'image/png') }
  end

end
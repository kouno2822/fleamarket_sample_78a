FactoryBot.define do

  factory :user do
    nickname              {"タロウ"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_furi        {"ヤマダ"}
    first_name_furi       {"タロウ"}
    birth                 {"1990-12-10"}
    send_last_name        {"山田"}
    send_first_name       {"太郎"}
    send_last_name_furi   {"ヤマダ"}
    send_first_name_furi  {"タロウ"}
    post                  {"000-1111"}
    prefecture            {"愛知県"}
    city                  {"名古屋市中区"}
    block                 {"栄3-10"}
  end

end
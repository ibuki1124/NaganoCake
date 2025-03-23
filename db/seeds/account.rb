# 管理者アカウント
Admin.create!(email: 'admin@example.com', password: 'password')
# 会員アカウント
num = 15
num.times do
  name = Gimei.name

  Customer.create!(
    email: Faker::Internet.email,
    password: 'password', # 全ての顧客に共通のパスワードを設定
    last_name: name.last.kanji,
    first_name: name.first.kanji,
    last_name_kana: name.last.katakana,
    first_name_kana: name.first.katakana,
    postal_code: Faker::Number.number(digits: 7).to_s,
    address: Gimei.address.kanji + Faker::Number.number(digits: 1).to_s + "-" + Faker::Number.number(digits: 1).to_s + "-" + Faker::Number.number(digits: 1).to_s,
    telephone_number: Faker::PhoneNumber.cell_phone.gsub(/-/, '')
  )
end
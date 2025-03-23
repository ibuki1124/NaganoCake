genre_names = [
  "ケーキ",
  "プリン",
  "焼き菓子",
  "キャンディ",
  "チョコレート",
  "アイスクリーム",
  "ガム",
  "クッキー",
  "パイ",
  "ドーナツ",
  "マカロン",
  "マシュマロ",
  "ワッフル",
  "クレープ"
]
genre_names.each do |genre_name|
  Genre.create!(name: genre_name)
end
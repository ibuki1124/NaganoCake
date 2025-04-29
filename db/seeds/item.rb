item = [
  {name: "いちごケーキ", introduction: "いちごがたっぷりのっています。", price: 500, genre_id: 1},
  {name: "チョコレートケーキ", introduction: "濃厚なチョコレートケーキです。", price: 600, genre_id: 1},
  {name: "カスタードプリン", introduction: "とろけるカスタードプリンです。", price: 300, genre_id: 2},
  {name: "チョコレートプリン", introduction: "濃厚なチョコレートプリンです。", price: 350, genre_id: 2},
  {name: "マドレーヌ", introduction: "バターの香りが豊かなマドレーヌです。", price: 250, genre_id: 3},
  {name: "フィナンシェ", introduction: "アーモンドの香りが香ばしいフィナンシェです。", price: 280, genre_id: 3},
  {name: "フルーツキャンディ", introduction: "色々なフルーツの味が楽しめます。", price: 100, genre_id: 4},
  {name: "ミルクキャンディ", introduction: "濃厚なミルクの味わいです。", price: 120, genre_id: 4},
  {name: "ミルクチョコレート", introduction: "まろやかなミルクチョコレートです。", price: 400, genre_id: 5},
  {name: "ビターチョコレート", introduction: "カカオの風味が豊かなビターチョコレートです。", price: 450, genre_id: 5},
  {name: "バニラアイス", introduction: "定番のバニラアイスです。", price: 350, genre_id: 6},
  {name: "ストロベリーアイス", introduction: "甘酸っぱいストロベリーアイスです。", price: 380, genre_id: 6},
  {name: "ミントガム", introduction: "爽快なミント味のガムです。", price: 100, genre_id: 7},
  {name: "フルーツガム", introduction: "色々なフルーツの味が楽しめます。", price: 120, genre_id: 7},
  {name: "チョコクッキー", introduction: "チョコレートチップがたっぷり入ったクッキーです。", price: 200, genre_id: 8},
  {name: "バタークッキー", introduction: "バターの風味が豊かなクッキーです。", price: 220, genre_id: 8},
  {name: "アップルパイ", introduction: "りんごがたっぷりのアップルパイです。", price: 450, genre_id: 9},
  {name: "ミートパイ", introduction: "ジューシーなミートパイです。", price: 500, genre_id: 9},
  {name: "プレーン", introduction: "定番のプレーン味のドーナツです。", price: 180, genre_id: 10},
  {name: "チョコ", introduction: "チョコレートでコーティングされたドーナツです。", price: 200, genre_id: 10},
  {name: "ピスタチオ", introduction: "ピスタチオ風味のマカロンです。", price: 300, genre_id: 11},
  {name: "ラズベリー", introduction: "ラズベリー風味のマカロンです。", price: 320, genre_id: 11},
  {name: "プレーンマシュマロ", introduction: "ふわふわのプレーンマシュマロです。", price: 150, genre_id: 12},
  {name: "チョコマシュマロ", introduction: "チョコレートでコーティングされたマシュマロです。", price: 180, genre_id: 12},
  {name: "プレーンワッフル", introduction: "サクサクのプレーンワッフルです。", price: 250, genre_id: 13},
  {name: "チョコワッフル", introduction: "チョコレートでコーティングされたワッフルです。", price: 280, genre_id: 13},
  {name: "チョコバナナクレープ", introduction: "チョコレートとバナナのクレープです。", price: 400, genre_id: 14},
  {name: "いちごクレープ", introduction: "いちごがたっぷりのクレープです。", price: 420, genre_id: 14},
]
item.each do |item|
  Item.create!(item)
  item_data = Item.find_by(name: item[:name])
  file_path = Rails.root.join("app/assets/images/items/item-#{item_data.id}.jpg")
  no_image = Rails.root.join("app/assets/images/no_image.jpg")
  if File.exist?(file_path)
    item_data.image.attach(io: File.open(file_path), filename: "item-#{item_data.id}.jpg", content_type: "image/jpeg")
  else
    item_data.image.attach(io: File.open(no_image), filename: "no_image.jpg", content_type: "image/jpeg")
  end
end
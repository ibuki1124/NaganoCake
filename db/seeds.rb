# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker' # Fakerを使用するために追加
require "./db/seeds/account.rb" # ユーザーのseedデータを作成するために追加
require "./db/seeds/genre.rb" # ジャンルのseedデータを作成するために追加
require "./db/seeds/item.rb" # 商品のseedデータを作成するために追加
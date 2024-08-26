# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")

ball_parks = %w(
  エスコンフィールドHOKKAIDO
  宮城球場
  西武ドーム
  千葉マリンスタジアム
  東京ドーム
  明治神宮野球場
  横浜スタジアム
  ナゴヤドーム
  大阪ドーム
  阪神甲子園球場
  広島市民球場
  福岡ドーム
)
ball_parks = ball_parks.map { |name| BallPark.create!(name: name) }

shop_names = ["焼き鳥スタジアム", "アサビール", "フライドポテト専門店"]

shop_names.each.with_index(1) do |name, i|
  shop = Shop.create!(name: name, email: "shop#{i}@test.com", password: "password", phone: "000-000-00#{i}", ball_park_id: ball_parks.sample.id)
end

menu_attributes = [
    {shop_id: 1, name: "もも", price: 200, category: "food", comment: "国産長州鳥のももです。"},
    {shop_id: 1, name: "かわ", price: 200, category: "food", comment: "国産長州鳥のかわです。"},
    {shop_id: 1, name: "きも", price: 200, category: "food", comment: "国産長州鳥のきもです。"},
    {shop_id: 2, name: "小ビール", price: 400, category: "beer", comment: "250ml"},
    {shop_id: 2, name: "中ビール", price: 800, category: "beer", comment: "450ml"},
    {shop_id: 3, name: "ロングポテト", price: 600, category: "food", comment: "アツアツ揚げたてです。"},
  ]
  
menu_attributes.each { |menu_attribute| Menu.create!(menu_attribute) }

user_names = ["山田", "すずき", "sato", "m(_ _)m"]

comment_samples = %w(
    おいしかった。
    あまり暖かくなかった。
    もう一度食べたい。
    かなりのボリュームでした。
  )

user_names.each.with_index(1) do |name, i|
  user = User.create!(name: name, email: "user#{i}@test.com", password: "password")
  
  (0..rand(0..3)).each do |n|
    user.comments.create!(menu_id: rand(1..menu_attributes.size), content: comment_samples.sample)
  end
  
  (0..rand(0..shop_names.size)).each.with_index(1) do |n, index|
    user.reviews.create!(shop_id: index, star: rand(1..5))
  end
end
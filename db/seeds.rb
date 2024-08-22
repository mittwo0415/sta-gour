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
ball_parks.each { |name| BallPark.create!(name: name) }
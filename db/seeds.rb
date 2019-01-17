# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |i|
  category = Category.create(category_name: "#{i}番目のカテゴリ")
  category.article.create(
    content_text: "これは、テスト用コンテンツの#{i}番目の内容です。",
    meta_description: "テストのメタディスクプリションです。(#{i})",
    content_url: "/test#{i}",
    content_title: "タイトル #{i}"
  )
end

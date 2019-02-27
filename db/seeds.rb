# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include ActionDispatch::TestProcess

# development
#image_path = fixture_file_upload(Rails.root.join('app/assets/images', 'sample.jpg'))

# production
image_path = File.join(Rails.root, 'app/assets/images/sample.jpg')
Medium.create(avatar: image_path)

5.times do |i|
  category = Category.create(category_name: "#{i}番目のカテゴリ")
  category.article.create(
    content_text: "これは、テスト用コンテンツの#{i}番目の内容です。",
    meta_description: "テストのメタディスクプリションです。(#{i})",
    content_url: "/test-a#{i}",
    content_title: "タイトル #{i}",
    media_id: 1,
    open_status: 1,
    fixed_status: 0,
    famous_status: 0
  )
end

5.times do |i|
  category = Category.create(category_name: "1#{i}番目のカテゴリ")
  category.article.create(
    content_text: "これは、テスト用コンテンツの1#{i}番目の内容です。",
    meta_description: "テストのメタディスクプリションです。(1#{i})",
    content_url: "/test-b#{i}",
    content_title: "タイトル 1#{i}",
    media_id: 1,
    open_status: 1,
    fixed_status: 0,
    famous_status: 1
  )
end

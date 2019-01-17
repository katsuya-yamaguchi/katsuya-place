class Category < ApplicationRecord
  # 外部キーとしてarticlesテーブルのcategories_idから参照されている。
  has_many :article, class_name: 'Article', foreign_key: 'categories_id'
end

class Medium < ApplicationRecord
  has_one_attached :avatar

  # 外部キーとしてarticlesテーブルのcategories_idから参照されている。
  has_many :article, class_name: 'Article', foreign_key: 'media_id'
end

class Article < ApplicationRecord
  belongs_to :category, class_name: 'Category', foreign_key: 'categories_id'
  validates :content_title, presence: true
  validates :content_url, presence: true
  validates :content_text, presence: true
  has_one_attached :top_image
end

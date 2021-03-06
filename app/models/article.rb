class Article < ApplicationRecord
  belongs_to :category, class_name: 'Category', foreign_key: 'categories_id'
  belongs_to :medium, class_name: 'Medium', foreign_key: 'media_id'
  validates :content_title, presence: true
  validates :content_url, presence: true
  validates :content_text, presence: true
end

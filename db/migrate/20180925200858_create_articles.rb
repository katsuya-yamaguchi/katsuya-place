class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content_text
      t.text :meta_description
      t.string :content_url, limit: 255
      t.string :content_title, limit: 255
      t.references :categories, foreign_key: true
      t.references :media, foreign_key: true
      t.timestamps
    end
  end
end

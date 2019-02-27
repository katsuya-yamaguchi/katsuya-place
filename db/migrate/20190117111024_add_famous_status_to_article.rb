class AddFamousStatusToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :famous_status, :integer, default: 0
    add_reference :articles, :categories, foreign_key: true 
  end
end

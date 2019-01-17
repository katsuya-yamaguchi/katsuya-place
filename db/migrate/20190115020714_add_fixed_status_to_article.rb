class AddFixedStatusToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :fixed_status, :integer, default: 0
  end
end

class AddPublishStatusToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :open_status, :integer, default: 0
  end
end

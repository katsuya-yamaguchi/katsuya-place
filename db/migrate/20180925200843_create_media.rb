class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :media_file_name, limit: 255
      t.string :mdeia_url, limit: 255
      t.timestamps
    end
  end
end

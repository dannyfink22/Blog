class AddImageUrlToTags < ActiveRecord::Migration
  def change
    add_column :tags, :image_url, :string
  end
end

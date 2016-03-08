class AddPublishStatusToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :publish_status, :boolean, default: 0, null: false
  end
end

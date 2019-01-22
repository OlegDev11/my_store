class AddUrlInfoColumnToItems < ActiveRecord::Migration[5.2]
  def change
      add_column :items, :url_info, :string  
  end
end

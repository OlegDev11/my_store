class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :description, :string    #Добавление нового столбца в таблицу 
  end
end

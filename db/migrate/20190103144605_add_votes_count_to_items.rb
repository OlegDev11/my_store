class AddVotesCountToItems < ActiveRecord::Migration[5.2]
  def change
      add_column :items, :votes_count, :integer, default: 0   #Добавляем колонку votes_count в таблицу items с типом данных int, по умолчанию 0
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.float    :price            #добавляем в таблицу цену
      t.string   :name             #имя товаров
      t.boolean  :real             #является ли товар реальным или вертуальным
      t.float    :weight           #вес товара
      t.timestamps
    end
      add_index :items, :price     #это то что нужно проиндексировать
      add_index :items, :name      #для поиска по индексу полей price and name
  end
end

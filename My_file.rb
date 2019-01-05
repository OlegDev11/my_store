# создаём модель item

class Item < ApplicationRecord
  validates :price, numericality: {greater_than: 0, allow_nil: true}   #создаём валидацию больше чем 0, и если не чего не писать
  validates :name, :description, :price, :weight, presence: true       #создаём обязательную валидацию

#колбэки, в нутри блока будет выполнятся код
#  after_initialize {puts "init"}
#  after_save {puts "save"}
#  after_create {puts "create"}
#  after_update {puts "updete"}
#  after_destroy {puts "destroy"}
end

#схема
ActiveRecord::Schema.define(version: 2019_01_04_123643) do

  create_table "items", force: :cascade do |t|
    t.float "price"
    t.string "name"
    t.boolean "real"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "votes_count", default: 0
  end
end

#миграция create_items
def change
  create_table :items do |t|
    t.float    :price            #добавляем в таблицу цену
    t.string   :name             #имя товаров
    t.boolean  :real             #является ли товар реальным или вертуальным
    t.float    :weight           #вес товара
    t.timestamps
  end
    add_index :items :price     #это то что нужно проиндексировать
    add_index :items :name      #для поиска по индексу полей price and name
end
end

#add_column_to_items.rb
class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :description, :string                #Добавление нового столбца в таблицу
end

#V_add_votes_count_to_items.rbz
class AddVotesCountToItems < ActiveRecord::Migration[5.2]
  def change
      add_column :items, :votes_count, :integer, default: 0   #Добавляем колонку votes_count в таблицу items с типом данных int, по умолчанию 0
  end
end

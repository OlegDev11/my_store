class Item < ApplicationRecord
  validates :price, numericality: {greater_than: 0, allow_nil: true}   #создаём валидацию больше чем 0, и если не чего не писать
  validates :name, :description, :price, :weight, presence: true       #создаём обязательную валидацию

has_many :positions
has_many :carts, through: :positions
has_many :comments, as: :commentable
#  has_and_belongs_to_many :carts
#колбэки, в нутри блока будет выполнятся код
#  after_initialize {puts "init"}
#  after_save {puts "save"}
#  after_create {puts "create"}
#  after_update {puts "updete"}
#  after_destroy {puts "destroy"}
end

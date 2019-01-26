class Item < ApplicationRecord
  validates :price, numericality: {greater_than: 0, allow_nil: true}   #создаём валидацию больше чем 0, и если не чего не писать
  validates :name, :description, :price, :weight, presence: true       #создаём обязательную валидацию
  validates :name, :price, presence: true

  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one  :avatar                                 #Ассоциация (у товара есть одна картинка)

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  #after_save :save_avatar

#def avatar=(i)
  #if !avatar || !new_record
  #  @item = Item.create(i.merge({avatar: self}))
  #end
#end

#def save_avatar
# @item = Itim.save
#end

#  has_and_belongs_to_many :carts
#колбэки, в нутри блока будет выполнятся код
#  after_initialize {puts "init"}
#  after_save {puts "save"}
#  after_create {puts "create"}
#  after_update {puts "updete"}
#  after_destroy {puts "destroy"}
end

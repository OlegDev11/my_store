class Order < ApplicationRecord
     attr_accessor :user, :user_id     #в БД только атрибут :user_id
     belongs_to :user
end

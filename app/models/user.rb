class User < ApplicationRecord
  attr_accessor  :email, :password, :password_confirmation, :remember_me

  has_one  :cart
  has_many :orders
end

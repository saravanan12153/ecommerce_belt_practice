class User < ActiveRecord::Base
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :sales
  has_many :purchases, :through => :sales, :source => :product
end

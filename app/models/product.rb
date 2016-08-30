class Product < ActiveRecord::Base
  belongs_to :seller, :class_name => 'User', :foreign_key => 'user_id'
  has_many :sales
end

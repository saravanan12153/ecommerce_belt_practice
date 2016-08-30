class Sale < ActiveRecord::Base
  belongs_to :product
  # belongs_to :user
  belongs_to :buyer, :class_name => 'User', :foreign_key => :user_id
end

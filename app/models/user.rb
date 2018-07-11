class User < ApplicationRecord
   
 #attr_accessor :email, :name, :phone 
  validates :name, presence: true
  validates :email, :phone, presence: true, uniqueness: false

  
end


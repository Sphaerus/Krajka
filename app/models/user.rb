class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  before_create :initialize_cart
  
  has_one :cart
  has_many :orders
  has_many :addresses
  
  def initialize_cart
    @cart = self.build_cart
  end       
end

class Address < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  validates :street, presence: true
  validates :town, presence: true
  
end

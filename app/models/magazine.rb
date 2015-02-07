class Magazine < ActiveRecord::Base
  attr_accessor :cover_cache
  
  mount_uploader :cover, CoverUploader
  
  validates :price, presence: true
  validates :title, presence: true
  validates :date, presence: true
  
  scope :latest, -> { order("created_at desc")}
  
  def display_title
    "#{title} - #{date}"
  end
  
  def display_price
    "#{price} PLN"
  end
end

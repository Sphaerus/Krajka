class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  
  accepts_nested_attributes_for :order_items
  
  def display_id
    "Zamówienie nr #{id}"
  end
  
  def order!
    self.ordered = true
    self.save
  end
  
  def status
    if ordered?
      if confirmed?
        return :confirmed_by_admin
      else
        return :not_confirmed_by_admin
      end
    else
      return :not_ordered
    end
  end
end

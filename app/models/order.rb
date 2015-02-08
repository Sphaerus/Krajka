class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy
  
  validates :address_id, presence: true
  validate :any_order_items?, on: :create
    
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
  
  def any_order_items?
    byebug
    unless order_items.any? {|order_item| order_item.to_order == "1"}
      self.errors["zamowienie"] = "nie moze byc zlozone bez wybrania produktow"
    end
  end

end

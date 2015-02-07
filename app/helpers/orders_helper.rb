module OrdersHelper
  def display_order_status(order)
    case order.status
    when :confirmed_by_admin
      return "Opłata potwierdzona przez administratora"
    when :not_confirmed_by_admin
      return "Zamówienie oczekuje na potwierdzenie opłaty przez administratora"
    when :not_ordered
      return "Zamówienie niepotwierdzone"   
    end   
  end
end
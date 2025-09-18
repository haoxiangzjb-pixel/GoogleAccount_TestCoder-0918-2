namespace py order_service

struct Order {
  1: i32 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: bool is_processed
}

service OrderProcessor {
  bool processOrder(1: Order order),
  Order getOrder(1: i32 order_id),
  list<Order> getAllOrders()
}
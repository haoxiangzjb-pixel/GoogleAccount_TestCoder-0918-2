// OrderStatus.ts

/**
 * Enum representing the possible states of an order.
 */
enum OrderStatus {
  Pending = 'PENDING',
  Confirmed = 'CONFIRMED',
  Shipped = 'SHIPPED',
  Delivered = 'DELIVERED',
  Cancelled = 'CANCELLED',
}

export default OrderStatus;
/**
 * 订单状态枚举
 */
export enum OrderStatus {
  PENDING = 'PENDING',        // 待处理
  CONFIRMED = 'CONFIRMED',    // 已确认
  SHIPPED = 'SHIPPED',        // 已发货
  DELIVERED = 'DELIVERED',    // 已送达
  CANCELLED = 'CANCELLED',    // 已取消
  REFUNDED = 'REFUNDED'       // 已退款
}

// 示例用法
const currentOrderStatus: OrderStatus = OrderStatus.PENDING;
console.log('当前订单状态:', currentOrderStatus);

// 状态检查函数
function isOrderCompleted(status: OrderStatus): boolean {
  return status === OrderStatus.DELIVERED || status === OrderStatus.REFUNDED;
}

// 测试函数
console.log('订单是否已完成:', isOrderCompleted(OrderStatus.PENDING)); // false
console.log('订单是否已完成:', isOrderCompleted(OrderStatus.DELIVERED)); // true
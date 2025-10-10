/**
 * 枚举表示订单状态
 */
export enum OrderStatus {
  Pending = 'pending',      // 待处理
  Confirmed = 'confirmed',  // 已确认
  Shipped = 'shipped',      // 已发货
  Delivered = 'delivered',  // 已送达
  Cancelled = 'cancelled',  // 已取消
  Refunded = 'refunded'     // 已退款
}

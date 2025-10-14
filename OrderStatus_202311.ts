// 定义订单状态的 TypeScript 枚举
enum OrderStatus {
  Pending = 'PENDING',      // 待处理
  Shipped = 'SHIPPED',      // 已发货
  Delivered = 'DELIVERED',  // 已送达
  Cancelled = 'CANCELLED'   // 已取消
}

export { OrderStatus };
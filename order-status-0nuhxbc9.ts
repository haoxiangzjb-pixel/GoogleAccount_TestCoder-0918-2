/**
 * 订单状态枚举
 */
export enum OrderStatus {
  /**
   * 待付款
   */
  PENDING_PAYMENT = 'PENDING_PAYMENT',
  
  /**
   * 待发货
   */
  PENDING_SHIPMENT = 'PENDING_SHIPMENT',
  
  /**
   * 已发货
   */
  SHIPPED = 'SHIPPED',
  
  /**
   * 已完成
   */
  COMPLETED = 'COMPLETED',
  
  /**
   * 已取消
   */
  CANCELLED = 'CANCELLED',
  
  /**
   * 退款中
   */
  REFUND_IN_PROGRESS = 'REFUND_IN_PROGRESS',
  
  /**
   * 已退款
   */
  REFUNDED = 'REFUNDED'
}

// 示例用法
console.log('订单状态枚举定义完成');
console.log(OrderStatus.PENDING_PAYMENT); // 输出: PENDING_PAYMENT
console.log(OrderStatus.SHIPPED); // 输出: SHIPPED
/**
 * 订单状态枚举
 */
export enum OrderStatus {
  /**
   * 待付款
   */
  PENDING_PAYMENT = 'PENDING_PAYMENT',
  
  /**
   * 已付款/待发货
   */
  PAID = 'PAID',
  
  /**
   * 发货中
   */
  SHIPPED = 'SHIPPED',
  
  /**
   * 已收货
   */
  DELIVERED = 'DELIVERED',
  
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
  REFUNDING = 'REFUNDING',
  
  /**
   * 已退款
   */
  REFUNDED = 'REFUNDED'
}
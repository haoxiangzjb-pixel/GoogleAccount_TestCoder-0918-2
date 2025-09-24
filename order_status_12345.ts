/**
 * 枚举表示订单的不同状态
 */
export enum OrderStatus {
  /**
   * 订单已创建，等待付款
   */
  PENDING_PAYMENT = 'pending_payment',

  /**
   * 付款已确认，准备发货
   */
  CONFIRMED = 'confirmed',

  /**
   * 订单已发货
   */
  SHIPPED = 'shipped',

  /**
   * 订单已完成
   */
  DELIVERED = 'delivered',

  /**
   * 订单已取消
   */
  CANCELLED = 'cancelled',
}
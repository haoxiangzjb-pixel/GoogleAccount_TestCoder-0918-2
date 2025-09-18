#!/usr/bin/env python3

import sys
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
    # Создаем соединение с сервером
    transport = TSocket.TSocket('127.0.0.1', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = OrderService.Client(protocol)
    
    # Открываем соединение
    transport.open()
    
    try:
        # Создаем новый заказ
        print("=== Создание нового заказа ===")
        new_order = NewOrder(
            customer_name="Иван Иванов",
            items=["Пицца", "Салат", "Напиток"],
            total_amount=1250.50
        )
        
        order_id = client.createOrder(new_order)
        print(f"Создан заказ с ID: {order_id}")
        
        # Создаем еще один заказ
        print("\n=== Создание второго заказа ===")
        new_order2 = NewOrder(
            customer_name="Мария Петрова",
            items=["Бургер", "Картофель фри"],
            total_amount=890.00
        )
        
        order_id2 = client.createOrder(new_order2)
        print(f"Создан заказ с ID: {order_id2}")
        
        # Получаем информацию о заказе
        print("\n=== Получение информации о заказе ===")
        order = client.getOrder(order_id)
        print(f"Заказ #{order.id}:")
        print(f"  Клиент: {order.customer_name}")
        print(f"  Товары: {', '.join(order.items)}")
        print(f"  Сумма: {order.total_amount}")
        print(f"  Статус: {order.status}")
        print(f"  Дата создания: {order.created_at}")
        
        # Получаем все заказы
        print("\n=== Получение всех заказов ===")
        all_orders = client.getAllOrders()
        for o in all_orders:
            print(f"Заказ #{o.id} от {o.customer_name} на сумму {o.total_amount}, статус: {o.status}")
        
        # Обновляем статус заказа
        print("\n=== Обновление статуса заказа ===")
        result = client.updateOrderStatus(order_id, "в обработке")
        if result:
            print(f"Статус заказа #{order_id} успешно обновлен")
            
        # Проверяем обновленный статус
        updated_order = client.getOrder(order_id)
        print(f"Новый статус заказа #{order_id}: {updated_order.status}")
        
        # Пытаемся получить несуществующий заказ (демонстрация исключения)
        print("\n=== Попытка получения несуществующего заказа ===")
        try:
            client.getOrder(99999)
        except OrderNotFoundException as e:
            print(f"Получено исключение: {e.message}")
            
    except Thrift.TException as tx:
        print(f"Ошибка Thrift: {tx.message}")
        
    finally:
        # Закрываем соединение
        transport.close()

if __name__ == '__main__':
    main()
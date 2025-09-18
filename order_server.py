#!/usr/bin/env python3

import sys
import glob
import os
import time
from datetime import datetime

# Добавляем путь к сгенерированному коду в PYTHONPATH
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# Простое хранилище заказов в памяти
class OrderHandler:
    def __init__(self):
        self.orders = {}
        self.next_order_id = 1

    def createOrder(self, order):
        # Создаем новый заказ с уникальным ID
        order_id = self.next_order_id
        self.next_order_id += 1
        
        new_order = Order(
            id=order_id,
            customer_name=order.customer_name,
            items=order.items,
            total_amount=order.total_amount,
            status="created",
            created_at=datetime.now().isoformat()
        )
        
        self.orders[order_id] = new_order
        print(f"Создан заказ #{order_id} для {order.customer_name}")
        return order_id

    def getOrder(self, orderId):
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Заказ с ID {orderId} не найден")
        
        return self.orders[orderId]

    def getAllOrders(self):
        return list(self.orders.values())

    def updateOrderStatus(self, orderId, status):
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Заказ с ID {orderId} не найден")
        
        self.orders[orderId].status = status
        print(f"Статус заказа #{orderId} обновлен на {status}")
        return True

    def deleteOrder(self, orderId):
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Заказ с ID {orderId} не найден")
        
        del self.orders[orderId]
        print(f"Заказ #{orderId} удален")
        return True

if __name__ == '__main__':
    handler = OrderHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    print("Запуск Thrift сервера для обработки заказов...")
    server.serve()
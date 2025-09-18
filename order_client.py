#!/usr/bin/env python3

import sys
import time

# Добавляем gen-py в путь Python
sys.path.append('gen-py')

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

from order_service import OrderProcessor
from order_service.ttypes import Order


def main():
    # Создаем сокет для подключения к серверу
    transport = TSocket.TSocket('127.0.0.1', 9090)

    # Используем буферизованный транспорт
    transport = TTransport.TBufferedTransport(transport)

    # Используем бинарный протокол
    protocol = TBinaryProtocol.TBinaryProtocol(transport)

    # Создаем клиент
    client = OrderProcessor.Client(protocol)

    # Открываем соединение
    transport.open()

    print("Connected to the OrderProcessor server.")

    # Создаем тестовый заказ
    test_order = Order(
        id=1,
        customer_name="Alice Smith",
        items=["Laptop", "Mouse"],
        total_amount=1200.50,
        is_processed=False
    )

    print(f"Sending order: {test_order}")
    # Отправляем заказ на обработку
    result = client.processOrder(test_order)
    print(f"Order processed: {result}")

    # Ждем немного, чтобы сервер успел обработать
    time.sleep(0.1)

    # Получаем заказ по ID
    retrieved_order = client.getOrder(1)
    print(f"Retrieved order: {retrieved_order}")

    # Получаем все заказы
    all_orders = client.getAllOrders()
    print(f"All orders: {all_orders}")

    # Закрываем соединение
    transport.close()
    print("Connection closed.")


if __name__ == '__main__':
    try:
        main()
    except Thrift.TException as tx:
        print(f"Thrift exception: {tx.message}")
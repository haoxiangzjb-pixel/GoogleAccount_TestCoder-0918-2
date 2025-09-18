#!/usr/bin/env python3

import sys
import logging
from concurrent.futures import ThreadPoolExecutor

# Добавляем gen-py в путь Python
sys.path.append('gen-py')

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

from order_service import OrderProcessor
from order_service.ttypes import Order


class OrderHandler:
    def __init__(self):
        self.orders = {}
        self.log = logging.getLogger("OrderHandler")

    def processOrder(self, order: Order) -> bool:
        self.log.info(f"Processing order {order.id} for {order.customer_name}")
        # Здесь может быть логика обработки заказа
        order.is_processed = True
        self.orders[order.id] = order
        self.log.info(f"Order {order.id} processed successfully.")
        return True

    def getOrder(self, order_id: int) -> Order:
        self.log.info(f"Fetching order {order_id}")
        return self.orders.get(order_id, None)

    def getAllOrders(self) -> list:
        self.log.info("Fetching all orders")
        return list(self.orders.values())


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    
    handler = OrderHandler()
    processor = OrderProcessor.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    # Используем ThreadPoolServer для многопоточности
    server = TServer.TThreadPoolServer(processor, transport, tfactory, pfactory, daemon=True)
    server.setNumThreads(10) # Устанавливаем пул потоков
    
    print('Starting the order processor server on port 9090...')
    try:
        server.serve()
    except KeyboardInterrupt:
        print("Server stopped.")
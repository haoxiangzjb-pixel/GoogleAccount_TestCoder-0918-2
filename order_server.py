import sys
import logging
from gen import OrderService
from gen.ttypes import Order, OrderException
from thrift.transport import TSocket, TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# Настройка логирования
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Простая "база данных" в памяти
orders_db = {}
status_db = {}

class OrderServiceHandler:
    def createOrder(self, order):
        """Создает новый заказ."""
        logger.info(f"Создание заказа с ID {order.id}")
        if order.id in orders_db:
            raise OrderException(message=f"Заказ с ID {order.id} уже существует.")
        orders_db[order.id] = order
        status_db[order.id] = "CREATED"  # Устанавливаем начальный статус
        logger.info(f"Заказ {order.id} успешно создан. Статус: CREATED")
        return True

    def getOrder(self, id):
        """Получает заказ по ID."""
        logger.info(f"Получение заказа с ID {id}")
        if id not in orders_db:
            raise OrderException(message=f"Заказ с ID {id} не найден.")
        order = orders_db[id]
        logger.info(f"Заказ {id} найден.")
        return order

    def updateOrderStatus(self, id, status):
        """Обновляет статус заказа."""
        logger.info(f"Обновление статуса заказа {id} на {status}")
        if id not in orders_db:
            raise OrderException(message=f"Заказ с ID {id} не найден.")
        status_db[id] = status
        logger.info(f"Статус заказа {id} обновлен на {status}")
        return True

def run_server():
    handler = OrderServiceHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host="127.0.0.1", port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    print("Запуск сервера OrderService на порту 9090...")
    server.serve()
    print("Сервер остановлен.")

if __name__ == "__main__":
    run_server()
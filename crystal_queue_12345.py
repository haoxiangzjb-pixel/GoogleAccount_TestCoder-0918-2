import queue
import threading
import time

class Crystal:
    """
    Класс Crystal для управления очередью с поддержкой потокобезопасности.
    Предоставляет методы для добавления и извлечения элементов из очереди,
    а также для проверки состояния очереди.
    """

    def __init__(self):
        """
        Инициализирует внутреннюю очередь и блокировку.
        """
        self._queue = queue.Queue()
        self._lock = threading.Lock()

    def add_item(self, item):
        """
        Добавляет элемент в очередь.

        :param item: Элемент для добавления.
        """
        with self._lock:
            self._queue.put(item)
            print(f"Элемент '{item}' добавлен в очередь.")

    def get_item(self, timeout=None):
        """
        Извлекает элемент из очереди. Если очередь пуста, ждет.

        :param timeout: Максимальное время ожидания (в секундах). None для бесконечного ожидания.
        :return: Извлеченный элемент или None, если таймаут истек.
        """
        try:
            with self._lock:
                item = self._queue.get(timeout=timeout)
            print(f"Элемент '{item}' извлечен из очереди.")
            return item
        except queue.Empty:
            print("Таймаут ожидания элемента в очереди.")
            return None

    def size(self):
        """
        Возвращает текущий размер очереди.

        :return: Количество элементов в очереди.
        """
        with self._lock:
            size = self._queue.qsize()
        return size

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        :return: True, если очередь пуста, иначе False.
        """
        with self._lock:
            empty = self._queue.empty()
        return empty


# Пример использования
if __name__ == "__main__":
    crystal_queue = Crystal()

    # Добавление элементов
    crystal_queue.add_item("Элемент 1")
    crystal_queue.add_item("Элемент 2")
    print(f"Размер очереди: {crystal_queue.size()}")

    # Извлечение элемента
    item = crystal_queue.get_item()
    print(f"Получен элемент: {item}")
    print(f"Размер очереди: {crystal_queue.size()}")
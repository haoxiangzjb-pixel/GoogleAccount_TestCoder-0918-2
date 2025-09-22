import random

class Crystal:
    """
    Класс Crystal для управления очередью.
    Реализует структуру данных FIFO (First In, First Out).
    """
    
    def __init__(self):
        """Инициализирует пустую очередь."""
        self._items = []
        
    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.
        
        Args:
            item: Элемент для добавления в очередь.
        """
        self._items.append(item)
        
    def dequeue(self):
        """
        Удаляет и возвращает элемент из начала очереди.
        
        Returns:
            Элемент из начала очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди")
        return self._items.pop(0)
        
    def is_empty(self):
        """
        Проверяет, пуста ли очередь.
        
        Returns:
            bool: True, если очередь пуста, иначе False.
        """
        return len(self._items) == 0
        
    def size(self):
        """
        Возвращает количество элементов в очереди.
        
        Returns:
            int: Количество элементов в очереди.
        """
        return len(self._items)
        
    def front(self):
        """
        Возвращает элемент из начала очереди, не удаляя его.
        
        Returns:
            Элемент из начала очереди.
            
        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Очередь пуста")
        return self._items[0]
        
    def __str__(self):
        """
        Возвращает строковое представление очереди.
        
        Returns:
            str: Строковое представление очереди.
        """
        return f"Crystal Queue: {self._items}"


# Пример использования
if __name__ == "__main__":
    # Создаем экземпляр очереди
    queue = Crystal()
    
    # Добавляем элементы
    queue.enqueue("первый")
    queue.enqueue("второй")
    queue.enqueue("третий")
    
    print(queue)  # Crystal Queue: ['первый', 'второй', 'третий']
    print(f"Размер очереди: {queue.size()}")  # Размер очереди: 3
    print(f"Первый элемент: {queue.front()}")  # Первый элемент: первый
    
    # Извлекаем элементы
    print(f"Извлечен: {queue.dequeue()}")  # Извлечен: первый
    print(f"Извлечен: {queue.dequeue()}")  # Извлечен: второй
    
    print(queue)  # Crystal Queue: ['третий']
    print(f"Очередь пуста? {queue.is_empty()}")  # Очередь пуста? False
    
    # Извлекаем последний элемент
    print(f"Извлечен: {queue.dequeue()}")  # Извлечен: третий
    print(f"Очередь пуста? {queue.is_empty()}")  # Очередь пуста? True
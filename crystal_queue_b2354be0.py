class Crystal:
    """
    Класс Crystal для управления очередью (FIFO - First In, First Out).
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
            Элемент, который был первым добавлен в очередь.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди.")
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

    def peek(self):
        """
        Возвращает элемент из начала очереди, не удаляя его.

        Returns:
            Элемент в начале очереди.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно посмотреть элемент в пустой очереди.")
        return self._items[0]

    def __str__(self):
        """
        Возвращает строковое представление очереди.

        Returns:
            str: Строковое представление очереди.
        """
        return f"Crystal Queue({self._items})"


# Пример использования:
if __name__ == "__main__":
    # Создание экземпляра очереди
    queue = Crystal()
    
    # Проверка, что очередь пуста
    print(f"Очередь пуста? {queue.is_empty()}")  # True
    
    # Добавление элементов
    queue.enqueue("Первый")
    queue.enqueue("Второй")
    queue.enqueue(3)
    
    print(f"Очередь после добавления: {queue}")  # Crystal Queue(['Первый', 'Второй', 3])
    print(f"Размер очереди: {queue.size()}")  # 3
    
    # Просмотр первого элемента
    print(f"Первый элемент: {queue.peek()}")  # Первый
    
    # Извлечение элементов
    first_item = queue.dequeue()
    print(f"Извлеченный элемент: {first_item}")  # Первый
    print(f"Очередь после извлечения: {queue}")  # Crystal Queue(['Второй', 3])
    
    # Извлечение оставшихся элементов
    print(queue.dequeue())  # Второй
    print(queue.dequeue())  # 3
    
    # Проверка, что очередь снова пуста
    print(f"Очередь пуста? {queue.is_empty()}")  # True
    
    # Попытка извлечь из пустой очереди вызовет ошибку
    # queue.dequeue()  # Это вызовет IndexError
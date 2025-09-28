"""
A class to manage a queue with basic operations like enqueue, dequeue, and peek.
"""
class Crystal:
    def __init__(self):
        """
        Initializes an empty queue.
        """
        self._queue = []

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to be added.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item that was at the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self._queue.pop(0)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item that is at the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("peek at an empty queue")
        return self._queue[0]

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            The size of the queue.
        """
        return len(self._queue)

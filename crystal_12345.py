class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = []

    def add(self, item):
        """Add an item to the end of the queue."""
        self._queue.append(item)

    def get(self):
        """Remove and return the first item from the queue."""
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue.pop(0)

    def peek(self):
        """Return the first item from the queue without removing it."""
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue[0]

    def is_empty(self):
        """Check if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Return the size of the queue."""
        return len(self._queue)

    def clear(self):
        """Remove all items from the queue."""
        self._queue.clear()
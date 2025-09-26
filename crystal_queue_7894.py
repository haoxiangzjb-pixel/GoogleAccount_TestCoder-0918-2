class Crystal:
    """
    A simple queue management class.
    """
    def __init__(self):
        self._queue = []

    def add(self, item):
        """
        Adds an item to the end of the queue.
        """
        self._queue.append(item)

    def remove(self):
        """
        Removes and returns the item from the front of the queue.
        Raises an IndexError if the queue is empty.
        """
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue.pop(0)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.
        Raises an IndexError if the queue is empty.
        """
        if not self._queue:
            raise IndexError("Queue is empty")
        return self._queue[0]

    def is_empty(self):
        """
        Checks if the queue is empty.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.
        """
        return len(self._queue)


# Example usage:
if __name__ == "__main__":
    crystal = Crystal()
    crystal.add("First")
    crystal.add("Second")
    print(f"Size: {crystal.size()}")
    print(f"Front item: {crystal.peek()}")
    print(f"Removed item: {crystal.remove()}")
    print(f"Is empty: {crystal.is_empty()}")
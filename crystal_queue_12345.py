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

    def get_next(self):
        """
        Removes and returns the item from the front of the queue.
        Returns None if the queue is empty.
        """
        if not self._queue:
            return None
        return self._queue.pop(0)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.
        Returns None if the queue is empty.
        """
        if not self._queue:
            return None
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
# crystal = Crystal()
# crystal.add("first")
# crystal.add("second")
# print(crystal.get_next())  # Output: "first"
# print(crystal.peek())      # Output: "second"
# print(crystal.size())      # Output: 1
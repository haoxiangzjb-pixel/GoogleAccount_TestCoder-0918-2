class Crystal:
    """
    A simple queue management class named Crystal.
    """

    def __init__(self):
        """
        Initializes an empty queue.
        """
        self._queue = []

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item that was at the front of the queue, or None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue.pop(0)
        else:
            return None

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue, or None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue[0]
        else:
            return None

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
        """
        return len(self._queue)


# Example usage:
if __name__ == "__main__":
    # Create an instance of Crystal
    crystal_queue = Crystal()

    # Add some items to the queue
    crystal_queue.enqueue("Item 1")
    crystal_queue.enqueue("Item 2")
    crystal_queue.enqueue("Item 3")

    print(f"Queue size: {crystal_queue.size()}")
    print(f"Front item: {crystal_queue.peek()}")
    print(f"Dequeued item: {crystal_queue.dequeue()}")
    print(f"Queue size after dequeue: {crystal_queue.size()}")
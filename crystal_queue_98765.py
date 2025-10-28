import random
import string
from typing import Any, Optional

class Crystal:
    """
    A Crystal class for managing a queue.
    This class provides standard queue operations like enqueue, dequeue, etc.
    """
    
    def __init__(self):
        """Initialize an empty queue."""
        self._queue = []
    
    def enqueue(self, item: Any) -> None:
        """Add an item to the end of the queue."""
        self._queue.append(item)
    
    def dequeue(self) -> Optional[Any]:
        """Remove and return the first item from the queue."""
        if self.is_empty():
            return None
        return self._queue.pop(0)
    
    def peek(self) -> Optional[Any]:
        """Return the first item without removing it from the queue."""
        if self.is_empty():
            return None
        return self._queue[0]
    
    def is_empty(self) -> bool:
        """Check if the queue is empty."""
        return len(self._queue) == 0
    
    def size(self) -> int:
        """Return the size of the queue."""
        return len(self._queue)
    
    def display(self) -> None:
        """Display all items in the queue."""
        print("Queue contents:", self._queue)


# Example usage
if __name__ == "__main__":
    # Create a Crystal queue instance
    crystal_queue = Crystal()
    
    # Add some items to the queue
    crystal_queue.enqueue("First item")
    crystal_queue.enqueue("Second item")
    crystal_queue.enqueue("Third item")
    
    print(f"Queue size: {crystal_queue.size()}")
    print(f"Front item: {crystal_queue.peek()}")
    
    # Remove an item
    removed_item = crystal_queue.dequeue()
    print(f"Dequeued item: {removed_item}")
    
    # Display the remaining items
    crystal_queue.display()
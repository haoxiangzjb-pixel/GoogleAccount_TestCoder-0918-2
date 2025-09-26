import random
import string

class Crystal:
    """
    A class to manage a queue and provide functionality to save it.
    The queue operates on a First-In-First-Out (FIFO) basis.
    """

    def __init__(self):
        """Initializes an empty queue."""
        self._queue = []

    def enqueue(self, item):
        """Adds an item to the rear of the queue."""
        self._queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.
        Returns None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue.pop(0)
        else:
            print("Queue is empty. Cannot dequeue.")
            return None

    def front(self):
        """
        Returns the item at the front of the queue without removing it.
        Returns None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue[0]
        else:
            print("Queue is empty. No front item.")
            return None

    def is_empty(self):
        """Checks if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Returns the number of items in the queue."""
        return len(self._queue)

    def save_to_file(self, filename=None):
        """
        Saves the current state of the queue to a text file.
        If no filename is provided, a random one is generated.
        """
        if filename is None:
            # Generate a random filename
            random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
            filename = f"queue_save_{random_suffix}.txt"

        try:
            with open(filename, 'w') as f:
                for item in self._queue:
                    f.write(str(item) + '\n')
            print(f"Queue saved successfully to {filename}")
            return filename  # Return the name of the file saved
        except IOError as e:
            print(f"Error saving queue to file: {e}")
            return None


# Example usage:
if __name__ == "__main__":
    # Create an instance of Crystal
    my_crystal = Crystal()

    # Add some items
    my_crystal.enqueue("First")
    my_crystal.enqueue("Second")
    my_crystal.enqueue("Third")

    # Save the queue with a random filename
    saved_file = my_crystal.save_to_file()
    print(f"Queue saved to: {saved_file}")

    # Check the size
    print(f"Queue size: {my_crystal.size()}")

    # Dequeue an item
    item = my_crystal.dequeue()
    print(f"Dequeued item: {item}")

    # Save again with a specific name
    my_crystal.save_to_file("my_specific_queue.txt")

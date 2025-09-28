import queue
import pickle
import os

class Crystal:
    """
    A class to manage a queue with save and load functionality.
    """

    def __init__(self, save_file="crystal_queue.pkl"):
        """
        Initializes the Crystal object with an empty queue and a save file path.

        Args:
            save_file (str): The name of the file to save and load the queue. Defaults to 'crystal_queue.pkl'.
        """
        self.q = queue.Queue()
        self.save_file = save_file

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self.q.put(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue, or None if the queue is empty.
        """
        try:
            return self.q.get_nowait()
        except queue.Empty:
            return None

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        return self.q.empty()

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            int: The size of the queue.
        """
        return self.q.qsize()

    def save(self):
        """
        Saves the current state of the queue to the specified file using pickle.
        """
        with open(self.save_file, 'wb') as f:
            # Convert queue to list for easier saving, as pickle preserves Queue state correctly,
            # but converting to list is more straightforward for potential external inspection.
            # However, for direct Queue object preservation, we can pickle the queue object itself.
            # Let's pickle the queue object as is, which is valid.
            pickle.dump(self.q, f)

    def load(self):
        """
        Loads the queue state from the specified file.
        If the file does not exist, the queue remains empty.
        """
        if os.path.exists(self.save_file):
            with open(self.save_file, 'rb') as f:
                loaded_queue = pickle.load(f)
                # Replace the current queue object with the loaded one
                self.q = loaded_queue
        else:
            print(f"Save file '{self.save_file}' not found. Starting with an empty queue.")

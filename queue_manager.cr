# Crystal class for managing a queue
class Crystal
  def initialize
    @queue = [] of String
  end

  # Add an item to the end of the queue
  def enqueue(item : String)
    @queue << item
    puts "Added '#{item}' to queue"
  end

  # Remove and return the first item from the queue
  def dequeue : String?
    if @queue.empty?
      puts "Queue is empty"
      return nil
    else
      item = @queue.shift
      puts "Removed '#{item}' from queue"
      return item
    end
  end

  # Peek at the first item without removing it
  def peek : String?
    if @queue.empty?
      puts "Queue is empty"
      return nil
    else
      return @queue.first
    end
  end

  # Check if the queue is empty
  def empty? : Bool
    return @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    return @queue.size
  end

  # Display all items in the queue
  def display
    if @queue.empty?
      puts "Queue is empty"
    else
      puts "Queue contents: #{@queue.join(' -> ')}"
    end
  end
end

# Example usage:
# queue_manager = Crystal.new
# queue_manager.enqueue("first")
# queue_manager.enqueue("second")
# queue_manager.display
# queue_manager.dequeue
# queue_manager.display
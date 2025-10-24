# A simple queue implementation in Crystal
class CrystalQueue
  @queue : Array(String | Int32 | Float64 | Bool)

  def initialize
    @queue = [] of String | Int32 | Float64 | Bool
  end

  # Add an item to the back of the queue
  def enqueue(item)
    @queue << item
    puts "Added #{item} to queue"
  end

  # Remove and return the front item from the queue
  def dequeue
    if @queue.empty?
      puts "Queue is empty, nothing to dequeue"
      return nil
    else
      item = @queue.shift
      puts "Removed #{item} from queue"
      return item
    end
  end

  # Peek at the front item without removing it
  def peek
    if @queue.empty?
      puts "Queue is empty"
      return nil
    else
      return @queue.first
    end
  end

  # Check if the queue is empty
  def empty?
    return @queue.empty?
  end

  # Get the size of the queue
  def size
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

# Example usage
queue = CrystalQueue.new
queue.enqueue("First")
queue.enqueue("Second")
queue.enqueue(3)
queue.display
queue.dequeue
queue.display
# Crystal class for managing a queue
class Crystal
  def initialize
    @queue = [] of String
  end

  # Add an item to the end of the queue
  def enqueue(item : String)
    @queue << item
  end

  # Remove and return the first item from the queue
  def dequeue : String?
    @queue.shift
  end

  # Peek at the first item without removing it
  def peek : String?
    @queue.first?
  end

  # Check if the queue is empty
  def empty? : Bool
    @queue.empty?
  end

  # Get the size of the queue
  def size : Int32
    @queue.size
  end

  # Display all items in the queue
  def display
    puts @queue.join(", ")
  end
end

# Example usage
queue = Crystal.new
queue.enqueue("First")
queue.enqueue("Second")
queue.enqueue("Third")

puts "Queue size: #{queue.size}"
puts "Peek at first item: #{queue.peek}"
puts "Dequeue item: #{queue.dequeue}"
puts "Queue after dequeue:"
queue.display
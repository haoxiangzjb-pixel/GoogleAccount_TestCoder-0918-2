# This is a sample Crystal program that demonstrates using external libraries via Shards
require "json"

# A simple example using JSON functionality
class Person
  JSON.mapping({
    name: String,
    age: Int32,
    email: String
  })

  def initialize(@name : String, @age : Int32, @email : String)
  end

  def to_s
    "Person(name: #{@name}, age: #{@age}, email: #{@email})"
  end
end

# Create a sample person
person = Person.new("John Doe", 30, "john@example.com")

# Convert to JSON
json_string = person.to_json
puts "Serialized Person to JSON: #{json_string}"

# Parse JSON back to object
parsed_person = Person.from_json(json_string)
puts "Deserialized Person from JSON: #{parsed_person}"

# Simple HTTP example (commented out since it requires additional dependencies)
# require "http/client"
# response = HTTP::Client.get("https://httpbin.org/json")
# puts "Response status: #{response.status_code}"

puts "Crystal program with shard dependencies completed!"
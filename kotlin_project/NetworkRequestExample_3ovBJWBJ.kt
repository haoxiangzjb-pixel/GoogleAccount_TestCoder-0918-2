import kotlinx.coroutines.*
import java.net.URL
import java.util.Scanner
import kotlin.random.Random

// A simple data class to represent the response
data class User(val id: Int, val name: String)

// Simulate a network request function
suspend fun fetchUser(userId: Int): User {
    // Simulate network delay
    delay(Random.nextLong(500, 2000))
    // Simulate fetching data
    return User(userId, "User$userId")
}

// Main coroutine scope
fun main() = runBlocking {
    println("Starting network requests...")
    
    // Launch multiple concurrent requests
    val job1 = async { fetchUser(1) }
    val job2 = async { fetchUser(2) }
    val job3 = async { fetchUser(3) }
    
    // Await the results
    val user1 = job1.await()
    val user2 = job2.await()
    val user3 = job3.await()
    
    // Print the results
    println("Received: $user1")
    println("Received: $user2")
    println("Received: $user3")
    
    println("All requests completed.")
}
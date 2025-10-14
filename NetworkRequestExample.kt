import kotlinx.coroutines.*
import java.io.File
import java.util.*

// A suspending function that simulates a network request
suspend fun fetchDataFromNetwork(): String {
    println("Initiating network request...")
    delay(2000) // Simulate network delay
    return "Data successfully fetched from the network at ${System.currentTimeMillis()}"
}

fun main() = runBlocking {
    try {
        // Launch the network request in the background
        val deferredData = async { fetchDataFromNetwork() }

        // Do other work in the meantime (if any)
        println("Doing other work while waiting for the network request...")

        // Await the result of the network request
        val data = deferredData.await()

        // Generate a random filename with UUID
        val fileName = "NetworkData_${UUID.randomUUID()}.kt"

        // Write the received data to the newly created file
        File(fileName).writeText("// Network request result\nval networkResult = \"$data\"\n")

        println("Network request completed. Data saved to $fileName")

    } catch (e: TimeoutCancellationException) {
        println("Network request timed out.")
    } catch (e: Exception) {
        println("An error occurred: ${e.message}")
    }
}
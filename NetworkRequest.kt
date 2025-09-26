import kotlinx.coroutines.*
import java.io.File
import java.util.*

fun main() = runBlocking {
    // Simulate a network request using delay
    val data = withTimeout(5000) {
        delay(2000) // Simulating network delay
        "Sample data from network request"
    }

    // Generate a random filename
    val fileName = "NetworkData_${UUID.randomUUID()}.kt"
    val file = File(fileName)

    // Write the data to the file
    file.writeText("// Data fetched from network\nval networkData = \"$data\"")

    println("Network request completed and data saved to $fileName")
}
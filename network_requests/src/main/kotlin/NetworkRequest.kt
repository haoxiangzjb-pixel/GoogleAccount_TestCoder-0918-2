import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.*
import io.ktor.client.request.*
import kotlinx.coroutines.*

/**
 * Performs a network GET request using Ktor and Kotlin Coroutines.
 * @param url The URL to send the GET request to.
 * @return The response body as a String.
 */
suspend fun performNetworkRequest(url: String): String {
    val client = HttpClient(CIO) {
        install(HttpTimeout) {
            requestTimeoutMillis = 5000
            connectTimeoutMillis = 5000
            socketTimeoutMillis = 5000
        }
    }

    try {
        val response: String = client.get(url).body()
        println("Network request successful!")
        return response
    } catch (e: Exception) {
        println("Network request failed: ${e.message}")
        throw e
    } finally {
        client.close()
    }
}

/**
 * Main function to launch the network request.
 */
suspend fun main() {
    val url = "https://httpbin.org/get"
    println("Initiating network request to $url...")
    val result = performNetworkRequest(url)
    println("Response received (first 200 chars): ${result.take(200)}")
}
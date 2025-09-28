import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*

fun generateRandomFileName(): String {
    val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    return "request_" + (1..8).map { chars.random() }.joinToString("") + ".kt"
}

suspend fun makeRequestAndSaveToFile() {
    val client = HttpClient()
    try {
        val response: String = client.get("https://httpbin.org/get").bodyAsText()
        println("Response received, length: ${response.length}")

        val fileName = generateRandomFileName()
        val filePath = "/workspace/kotlin_requests/$fileName"
        kotlinx.coroutines.io.files.writeText(filePath, response)
        println("Response saved to file: $filePath")
    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    makeRequestAndSaveToFile()
}
import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import kotlin.io.path.createTempFile

fun main() = runBlocking {
    val client = HttpClient(CIO)

    try {
        val response: HttpResponse = client.get("https://httpbin.org/get")
        val responseBody = response.bodyAsText()

        // Generate a random filename with .kt extension
        val tempFile = createTempFile(suffix = ".kt")
        val randomKtFile = File(tempFile.toFile().absolutePath)

        randomKtFile.writeText("// Network request result saved on ${java.util.Date()}\n\n$responseBody")

        println("Response saved to: ${randomKtFile.absolutePath}")

    } catch (e: Exception) {
        println("An error occurred: ${e.message}")
    } finally {
        client.close()
    }
}
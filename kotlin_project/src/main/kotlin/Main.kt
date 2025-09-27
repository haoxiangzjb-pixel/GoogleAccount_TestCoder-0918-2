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

        val tempFile = createTempFile(suffix = ".kt")
        val file = File(tempFile.toUri())
        file.writeText(responseBody)

        println("Response saved to: ${file.absolutePath}")
    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        client.close()
    }
}
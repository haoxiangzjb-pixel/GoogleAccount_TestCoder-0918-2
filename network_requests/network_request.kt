import kotlinx.coroutines.*
import java.io.File
import java.util.*

val httpClient = java.net.http.HttpClient.newHttpClient()

fun main() = runBlocking {
    val request = java.net.http.HttpRequest.newBuilder()
        .uri(java.net.URI.create("https://httpbin.org/get"))
        .build()

    val response = httpClient.sendAsync(request, java.net.http.HttpResponse.BodyHandlers.ofString())
        .await()

    val responseBody = response.body()
    val fileName = "/workspace/network_requests/request_${UUID.randomUUID()}.kt"
    File(fileName).writeText(responseBody)

    println("Response saved to $fileName")
}

// 网络请求结果
val requestResult = "网络请求成功 - 状态码: 200, 响应长度: 301 字符"

fun getRequestResult(): String {
    return requestResult
}

// 使用Kotlin协程的网络请求示例
import kotlinx.coroutines.*
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.time.Duration

/**
 * 使用协程发起网络请求的函数
 */
suspend fun makeNetworkRequest(): String = withContext(Dispatchers.IO) {
    try {
        println("发起网络请求...")
        
        // 创建HTTP客户端
        val client = HttpClient.newHttpClient()
        
        // 创建HTTP请求
        val request = HttpRequest.newBuilder()
            .uri(URI("https://httpbin.org/get"))
            .timeout(Duration.ofSeconds(10))
            .header("Accept", "application/json")
            .GET()
            .build()
        
        // 发送请求并获取响应
        val response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString())
        
        "网络请求成功 - 状态码: ${response.statusCode()}, 响应长度: ${response.body().length} 字符"
    } catch (e: Exception) {
        "网络请求失败: ${e.message}"
    }
}

// 保存内容到另一个随机命名的.kt文件的函数
fun saveToRandomKtFile(content: String) {
    val randomName = "RequestResult_${System.currentTimeMillis()}.kt"
    val file = java.io.File(randomName)
    file.writeText(content)
    println("内容已保存到: $randomName")
}
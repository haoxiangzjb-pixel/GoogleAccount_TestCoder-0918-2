import kotlinx.coroutines.*
import java.io.File
import java.util.*
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.time.Duration

// 实际的网络请求函数
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

// 保存内容到随机命名的.kt文件
fun saveToRandomKtFile(content: String) {
    val randomName = "RequestResult_${System.currentTimeMillis()}.kt"
    val file = File(randomName)
    file.writeText(content)
    println("内容已保存到: $randomName")
}

fun main() = runBlocking {
    // 发起网络请求
    val result = withTimeoutOrNull(5000) { // 设置5秒超时
        makeNetworkRequest()
    }
    
    if (result != null) {
        // 保存结果到随机命名的.kt文件
        val fileContent = """
            // 网络请求结果
            val requestResult = "$result"
            
            fun getRequestResult(): String {
                return requestResult
            }
        """.trimIndent()
        
        saveToRandomKtFile(fileContent)
        println("网络请求完成并已保存到随机命名的.kt文件")
    } else {
        println("网络请求超时")
    }
}
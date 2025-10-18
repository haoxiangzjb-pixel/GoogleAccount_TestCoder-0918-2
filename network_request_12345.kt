import kotlinx.coroutines.*
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import kotlin.system.exitProcess

// 使用Kotlin协程发起网络请求的示例
class NetworkRequestWithCoroutines {
    
    // 挂起函数，用于发起网络请求
    suspend fun makeNetworkRequest(urlString: String): String = withContext(Dispatchers.IO) {
        try {
            val url = URL(urlString)
            val connection = url.openConnection() as HttpURLConnection
            connection.requestMethod = "GET"
            connection.connectTimeout = 5000 // 5秒超时
            connection.readTimeout = 5000
            
            val responseCode = connection.responseCode
            if (responseCode == HttpURLConnection.HTTP_OK) {
                val reader = BufferedReader(InputStreamReader(connection.inputStream))
                val response = reader.readText()
                reader.close()
                response
            } else {
                throw Exception("HTTP request failed with response code: $responseCode")
            }
        } catch (e: Exception) {
            throw Exception("Network request failed: ${e.message}")
        }
    }
    
    // 使用协程发起多个网络请求
    suspend fun performMultipleRequests() {
        println("发起网络请求...")
        
        // 创建多个异步请求
        val deferredResults = listOf(
            async { makeNetworkRequest("https://httpbin.org/get") },
            async { makeNetworkRequest("https://httpbin.org/headers") },
            async { makeNetworkRequest("https://jsonplaceholder.typicode.com/posts/1") }
        )
        
        // 等待所有请求完成
        try {
            val results = deferredResults.awaitAll()
            results.forEachIndexed { index, result ->
                println("请求 $index 结果: ${result.take(100)}...") // 只打印前100个字符
            }
        } catch (e: Exception) {
            println("请求失败: ${e.message}")
        }
    }
}

// 主函数
fun main() = runBlocking {
    val networkClient = NetworkRequestWithCoroutines()
    
    try {
        networkClient.performMultipleRequests()
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
    }
    
    println("所有网络请求完成")
}
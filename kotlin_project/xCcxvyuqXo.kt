import kotlinx.coroutines.*
import java.net.URL
import java.util.*

// 使用Kotlin协程发起网络请求的示例
fun main() = runBlocking {
    // 启动一个协程来执行网络请求
    val job = launch {
        try {
            println("开始发起网络请求...")
            // 使用 withContext 切换到IO线程执行阻塞的网络请求
            val result = withContext(Dispatchers.IO) {
                // 这里我们请求一个简单的网页作为示例
                URL("https://httpbin.org/get").readText()
            }
            println("网络请求成功，响应数据长度: ${result.length}")
            //println("响应数据预览: ${result.take(200)}...")
        } catch (e: Exception) {
            println("网络请求失败: ${e.message}")
        }
    }

    // 等待协程执行完成
    job.join()
    println("主程序结束")
}
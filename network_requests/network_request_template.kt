import kotlinx.coroutines.*
import java.io.File
import java.util.*

// A simple function to simulate a network request using delay
suspend fun performNetworkRequest(): String {
    println("发起网络请求...")
    delay(2000) // 模拟2秒的网络延迟
    println("网络请求完成!")
    return "{'status': 'success', 'data': 'Hello, World!'}"
}

fun main() = runBlocking {
    val result = withTimeoutOrNull(5000) { // 设置5秒超时
        performNetworkRequest()
    }

    if (result != null) {
        val fileName = "/workspace/network_requests/request_${UUID.randomUUID()}.kt"
        File(fileName).writeText("// 网络请求结果\nval response = \"$result\"\n")
        println("结果已保存到 $fileName")
    } else {
        println("请求超时或失败")
    }
}
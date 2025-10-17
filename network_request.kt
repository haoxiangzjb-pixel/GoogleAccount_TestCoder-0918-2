import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun fetchNetworkData(): String {
    delay(1000) // 模拟网络延迟
    return """
        {
            "status": "success",
            "data": {
                "message": "Hello from network request!",
                "timestamp": "${Date()}",
                "id": "${UUID.randomUUID()}"
            }
        }
    """.trimIndent()
}

// 将内容保存到随机命名的.kt文件中
fun saveToFile(content: String): String {
    val fileName = "output_${System.currentTimeMillis()}_${(1000..9999).random()}.kt"
    val file = File(fileName)
    file.writeText(content)
    return fileName
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    // 使用协程发起网络请求
    val networkResult = async { fetchNetworkData() }
    
    // 等待网络请求完成
    val result = networkResult.await()
    
    println("网络请求完成，结果：")
    println(result)
    
    // 将结果保存到随机命名的.kt文件中
    val fileName = saveToFile(result)
    println("结果已保存到文件：$fileName")
}
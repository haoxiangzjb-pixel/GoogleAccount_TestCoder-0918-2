import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun fetchDataFromNetwork(): String {
    return withContext(Dispatchers.IO) {
        // 模拟网络延迟
        delay(1000)
        // 模拟返回的网络数据
        """
        {
            "status": "success",
            "data": {
                "message": "Hello from network request!",
                "timestamp": "${Date()}",
                "randomNumber": ${kotlin.random.Random.nextInt(1000, 9999)}
            }
        }
        """.trimIndent()
    }
}

// 将数据保存到随机命名的.kt文件中
fun saveDataToRandomKtFile(data: String) {
    val randomFileName = "GeneratedFile_${System.currentTimeMillis()}_${kotlin.random.Random.nextInt(1000)}.kt"
    val file = File(randomFileName)
    
    file.writeText(
        """
        // Generated file with network response
        object NetworkResponse {
            const val RESPONSE_DATA = ${data.replace("\n", "").replace("\"", "\\\"")}
        }
        
        fun main() {
            println("Network response saved to: $randomFileName")
            println("Data: \${NetworkResponse.RESPONSE_DATA}")
        }
        """.trimIndent()
    )
    
    println("Data saved to: $randomFileName")
}

fun main() = runBlocking {
    println("发起网络请求...")
    
    try {
        val networkData = fetchDataFromNetwork()
        println("网络请求完成，收到数据:")
        println(networkData)
        
        saveDataToRandomKtFile(networkData)
    } catch (e: Exception) {
        println("Error during network request: ${e.message}")
    }
}
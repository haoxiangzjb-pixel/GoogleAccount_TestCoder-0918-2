import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求函数
suspend fun fetchNetworkData(): String {
    delay(1000) // 模拟网络延迟
    return """
        {
            "status": "success",
            "data": {
                "message": "Hello from network request!",
                "timestamp": "${System.currentTimeMillis()}",
                "randomValue": ${Random().nextInt(1000)}
            }
        }
    """.trimIndent()
}

// 生成随机文件名
fun generateRandomFileName(extension: String = "kt"): String {
    val random = Random()
    val sb = StringBuilder()
    repeat(8) {
        sb.append(('a'..'z').random())
    }
    return "${sb.toString()}_$extension.${extension}"
}

// 主函数
fun main() = runBlocking {
    try {
        println("发起网络请求...")
        val result = fetchNetworkData()
        println("网络请求完成，结果：\n$result")
        
        // 生成随机文件名
        val randomFileName = generateRandomFileName()
        val filePath = "/workspace/$randomFileName"
        
        // 将结果保存到随机命名的.kt文件中
        val fileContent = """
            // 随机生成的Kotlin文件
            // 创建时间: ${Date()}
            
            fun getNetworkResult(): String {
                return \"\"\"
                    $result
                \"\"\".trimIndent()
            }
            
            fun main() {
                println("从文件中获取网络请求结果:")
                println(getNetworkResult())
            }
        """.trimIndent()
        
        File(filePath).writeText(fileContent)
        println("网络请求结果已保存到文件: $filePath")
        
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
    }
}
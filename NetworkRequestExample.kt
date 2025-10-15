import kotlin.concurrent.thread
import java.io.File
import java.util.*
import kotlin.system.measureTimeMillis

// 模拟网络请求函数
fun fetchNetworkData(): String {
    Thread.sleep(1000) // 模拟网络延迟
    return "Response from network request: ${Random().nextInt(1000)}"
}

// 生成随机文件名
fun generateRandomFileName(extension: String = "kt"): String {
    val random = Random()
    val fileName = StringBuilder()
    repeat(10) {
        fileName.append(('a'..'z').random())
    }
    return "${fileName}_$extension.$extension"
}

// 将内容保存到随机命名的.kt文件中
fun saveToRandomFile(content: String) {
    val randomFileName = generateRandomFileName()
    val file = File(randomFileName)
    file.writeText(content)
    println("Content saved to: $randomFileName")
}

fun main() {
    println("发起网络请求...")
    
    var result: String? = null
    
    // 使用线程模拟异步发起网络请求
    val thread = thread {
        result = fetchNetworkData()
    }
    
    // 等待线程完成
    thread.join()
    
    println("收到响应: ${result!!}")
    
    // 创建保存内容
    val content = """
        // Generated file with network response
        fun getNetworkResponse(): String {
            return "${result!!}"
        }
        
        fun main() {
            println("Network response: ${'$'}{getNetworkResponse()}")
        }
    """.trimIndent()
    
    // 保存到随机命名的.kt文件中
    saveToRandomFile(content)
    
    println("完成!")
}
import kotlinx.coroutines.*
import java.net.URL
import java.util.UUID
import kotlin.io.path.Path
import kotlin.io.path.writeText

fun main() = runBlocking {
    // 使用协程发起网络请求
    val result = withContext(Dispatchers.IO) {
        val url = URL("https://httpbin.org/get")
        url.readText()
    }
    
    println("网络请求结果:")
    println(result)
    
    // 生成随机文件名
    val randomName = UUID.randomUUID().toString().take(10)
    val fileName = "$randomName.kt"
    
    // 将结果保存到文件
    val filePath = Path("/workspace/$fileName")
    filePath.writeText("""
// 网络请求结果保存文件
// 文件名: $fileName
// 生成时间: ${java.time.LocalDateTime.now()}

val responseData = \"\"\"
$result
\"\"\"

fun main() {
    println(responseData)
}
""".trimIndent())
    
    println("\n数据已保存到: /workspace/$fileName")
}

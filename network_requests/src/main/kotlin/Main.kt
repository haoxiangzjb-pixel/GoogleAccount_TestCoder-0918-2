import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.call.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import java.io.File
import kotlin.random.Random

@Serializable
data class Post(val userId: Int, val id: Int, val title: String, val body: String)

suspend fun fetchAndSavePost() {
    val client = HttpClient {
        install(ContentNegotiation) {
            json(Json {
                ignoreUnknownKeys = true
            })
        }
    }

    try {
        println("发起网络请求...")
        val response: Post = client.get("https://jsonplaceholder.typicode.com/posts/1").body()
        println("收到响应: ${response.title}")

        // 生成随机文件名
        val randomFileName = "PostData_${Random.nextInt(1000, 9999)}.kt"
        val filePath = "/workspace/network_requests/$randomFileName"

        val fileContent = """
            // 这个文件是通过Kotlin协程网络请求生成的
            // 请求的URL: https://jsonplaceholder.typicode.com/posts/1
            // 数据ID: ${response.id}
            
            val generatedData = ${
            """\"\"\"${response.body}\"\"\""""
        }

        """.trimIndent()

        File(filePath).writeText(fileContent)
        println("数据已保存到随机命名的Kotlin文件: $filePath")

    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    fetchAndSavePost()
}
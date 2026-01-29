import kotlinx.coroutines.*
import kotlinx.coroutines.Dispatchers.IO
import java.net.URL
import java.net.HttpURLConnection

// 协程网络请求示例
class NetworkManager {

    private val scope = CoroutineScope(IO + Job())

    // 使用协程发起GET请求
    suspend fun fetchData(urlString: String): String? {
        return withContext(IO) {
            try {
                val url = URL(urlString)
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 5000
                connection.readTimeout = 5000

                val responseCode = connection.responseCode
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    connection.inputStream.bufferedReader().use { it.readText() }
                } else {
                    null
                }
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }

    // 发起请求并保存结果
    fun fetchAndSave(urlString: String, callback: (String?) -> Unit) {
        scope.launch {
            val result = fetchData(urlString)
            callback(result)
        }
    }

    // 使用协程发起POST请求
    suspend fun postData(urlString: String, data: String): String? {
        return withContext(IO) {
            try {
                val url = URL(urlString)
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "POST"
                connection.connectTimeout = 5000
                connection.readTimeout = 5000
                connection.doInput = true
                connection.doOutput = true
                connection.setRequestProperty("Content-Type", "application/json")

                connection.outputStream.bufferedWriter().use { it.write(data) }

                val responseCode = connection.responseCode
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    connection.inputStream.bufferedReader().use { it.readText() }
                } else {
                    null
                }
            } catch (e: Exception) {
                e.printStackTrace()
                null
            }
        }
    }
}

// 主函数示例
fun main() = runBlocking {
    val manager = NetworkManager()
    
    // 示例：获取数据
    val result = manager.fetchData("https://jsonplaceholder.typicode.com/posts/1")
    println("Response: $result")
}

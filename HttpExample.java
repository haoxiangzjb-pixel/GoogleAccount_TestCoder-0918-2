import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.Random;

public class HttpExample {
    public static void main(String[] args) {
        try {
            System.out.println("发起网络请求...");
            
            // 使用Java 11+的HttpClient发起请求
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://httpbin.org/get"))
                    .timeout(Duration.ofSeconds(10))
                    .header("User-Agent", "Kotlin-Coroutine-Simulation")
                    .build();
            
            HttpResponse<String> response = client.send(request, 
                    HttpResponse.BodyHandlers.ofString());
            
            String result = response.body();
            System.out.println("网络请求完成");
            
            // 生成随机文件名
            String randomFileName = generateRandomFileName();
            String filePath = "/workspace/" + randomFileName;
            
            // 将结果保存到随机命名的.kt文件中
            String fileContent = String.format(
                "// 通过网络请求生成的Kotlin文件\n" +
                "// 生成时间: %s\n" +
                "\n" +
                "fun getNetworkResult(): String {\n" +
                "    return \"\"\"\n" +
                "        %s\n" +
                "    \"\"\".trimIndent()\n" +
                "}\n" +
                "\n" +
                "fun main() {\n" +
                "    println(\"从文件中获取网络请求结果:\")\n" +
                "    println(getNetworkResult())\n" +
                "}", 
                new java.util.Date(),
                result
            );
            
            File file = new File(filePath);
            java.nio.file.Files.write(file.toPath(), fileContent.getBytes());
            System.out.println("网络请求结果已保存到文件: " + filePath);
            
        } catch (Exception e) {
            System.out.println("发生错误: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private static String generateRandomFileName() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            sb.append((char) ('a' + random.nextInt(26)));
        }
        return sb.toString() + "_result.kt";
    }
}
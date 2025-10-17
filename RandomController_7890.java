import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class RandomController_7890 {

    public static void main(String[] args) {
        SpringApplication.run(RandomController_7890.class, args);
    }

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello from Spring Boot REST controller!";
    }
    
    @GetMapping("/api/data")
    public String getData() {
        return "This is sample data from the API endpoint";
    }
}
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class RestController_IaQ0Rr2d {

    public static void main(String[] args) {
        SpringApplication.run(RestController_IaQ0Rr2d.class, args);
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World! This is a Spring Boot REST controller.";
    }
}
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api")
public class SampleController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }
    
    @GetMapping("/greeting")
    public String greeting() {
        return "Welcome to our Spring Boot application!";
    }
}
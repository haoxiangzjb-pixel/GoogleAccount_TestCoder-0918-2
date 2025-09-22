import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomController {

    @GetMapping("/greeting")
    public String greeting() {
        return "Hello from Spring Boot!";
    }
}
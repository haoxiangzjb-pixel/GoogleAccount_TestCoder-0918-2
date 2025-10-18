import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;

@RestController
public class UserController {

    @GetMapping("/users")
    public ResponseEntity<String> getUsers() {
        return ResponseEntity.ok("Hello from Spring Boot REST controller!");
    }
}
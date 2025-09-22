import com.example.Calculator;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class RandomCalculatorTest {

    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-5, calculator.add(-2, -3));
        
        // Test mixed positive and negative
        assertEquals(1, calculator.add(3, -2));
        
        // Test zero
        assertEquals(3, calculator.add(3, 0));
        assertEquals(3, calculator.add(0, 3));
    }
}
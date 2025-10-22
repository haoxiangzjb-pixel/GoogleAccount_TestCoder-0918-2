import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestCalculatorAdd_7b3f2a {
    
    // Mock Calculator class for testing
    public static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(-3, calculator.add(0, -3));
        
        // Test both zeros
        assertEquals(0, calculator.add(0, 0));
    }
}
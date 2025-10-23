import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestCalculatorAdd_12345 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 3);
        assertEquals(8, result, "5 + 3 should equal 8");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-5, -3);
        assertEquals(-8, result, "-5 + (-3) should equal -8");
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 5);
        assertEquals(5, result, "0 + 5 should equal 5");
    }
    
    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(7, 0);
        assertEquals(7, result, "7 + 0 should equal 7");
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -3);
        assertEquals(7, result, "10 + (-3) should equal 7");
    }
}

class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
}
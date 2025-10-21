import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestCalculatorAdd_78945 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals(-5, result, "-2 + (-3) should equal -5");
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 0);
        assertEquals(5, result, "5 + 0 should equal 5");
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -5);
        assertEquals(5, result, "10 + (-5) should equal 5");
    }
}
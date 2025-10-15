import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TestCalculatorAddition78945 {
    
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
        int result = calculator.add(0, 0);
        assertEquals(0, result, "0 + 0 should equal 0");
    }
    
    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, 0);
        assertEquals(10, result, "10 + 0 should equal 10");
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -3);
        assertEquals(7, result, "10 + (-3) should equal 7");
    }
}
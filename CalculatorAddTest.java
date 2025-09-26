import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorAddTest {

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals("2 + 3 should equal 5", 5, result);
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals("(-2) + (-3) should equal -5", -5, result);
    }

    @Test
    public void testAdd_Zero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 0);
        assertEquals("5 + 0 should equal 5", 5, result);
    }

    @Test
    public void testAdd_PositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -3);
        assertEquals("10 + (-3) should equal 7", 7, result);
    }
}
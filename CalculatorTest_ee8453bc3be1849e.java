import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest_ee8453bc3be1849e {

    @Test
    public void testAddTwoPositiveNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(2, 3));
    }

    @Test
    public void testAddTwoNegativeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(-5, calculator.add(-2, -3));
    }

    @Test
    public void testAddPositiveAndNegativeNumber() {
        Calculator calculator = new Calculator();
        assertEquals(-1, calculator.add(2, -3));
    }

    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        assertEquals(3, calculator.add(3, 0));
    }

    @Test
    public void testAddLargeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(3000000000L, calculator.add(1500000000L, 1500000000L));
    }
}

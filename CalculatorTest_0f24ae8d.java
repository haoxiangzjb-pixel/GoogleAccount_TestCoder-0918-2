import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * JUnit test class for the Calculator add method.
 */
public class CalculatorTest_0f24ae8d {

    /**
     * Simple Calculator class with an add method for testing purposes.
     */
    static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }

    @Test
    void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
    }

    @Test
    void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(-5, calculator.add(-2, -3), "-2 + -3 should equal -5");
    }

    @Test
    void testAddMixedNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(1, calculator.add(-2, 3), "-2 + 3 should equal 1");
    }

    @Test
    void testAddWithZero() {
        Calculator calculator = new Calculator();
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
        assertEquals(7, calculator.add(0, 7), "0 + 7 should equal 7");
    }
}

package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ZDCIbLhiiOTest {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(-1, calculator.add(-3, 2), "-3 + 2 should equal -1");
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
    }
}
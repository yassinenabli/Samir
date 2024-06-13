package org.example;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

public class AdditionTest {

    @Test
    public void testNegativeInteger() {
        assertThrows(IllegalArgumentException.class, () -> {
            Addition.add(-2, 3);
        });
    }

    @Test
    public void testPositiveIntegers() {
        assertEquals(5, Addition.add(2, 3));
    }

    @Test
    public void testNonIntegerInput() {
        assertThrows(IllegalArgumentException.class, () -> {
            Addition.add(2, Integer.parseInt("A"));
        });
    }
}

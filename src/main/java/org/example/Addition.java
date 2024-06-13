package org.example;

public class Addition {
    public static int add(int a, int b) {
        if (a < 0 || b < 0) {
            throw new IllegalArgumentException("Both integers must be positive");
        }
        return a + b;
    }
}

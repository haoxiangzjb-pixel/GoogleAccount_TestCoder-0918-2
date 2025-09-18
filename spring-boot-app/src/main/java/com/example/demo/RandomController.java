package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
public class RandomController {

    @GetMapping("/greeting")
    public Map<String, String> greeting() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Hello from Spring Boot!");
        response.put("timestamp", String.valueOf(System.currentTimeMillis()));
        return response;
    }

    @GetMapping("/random")
    public Map<String, Object> random() {
        Map<String, Object> response = new HashMap<>();
        Random random = new Random();
        response.put("randomNumber", random.nextInt(100));
        response.put("note", "This is a random number between 0 and 99");
        return response;
    }
}
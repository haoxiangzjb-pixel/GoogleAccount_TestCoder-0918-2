package com.example.randomactivity

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class RandomActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Toast.makeText(this, "Hello from a randomly named Kotlin file!", Toast.LENGTH_SHORT).show()
    }
}
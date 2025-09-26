package com.example.random

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class RandomActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // Assuming a basic layout

        val toastMessage = "Hello from a randomly named Kotlin file!"
        Toast.makeText(this, toastMessage, Toast.LENGTH_SHORT).show()
    }
}
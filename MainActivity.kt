package com.example.toastactivity

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // This activity does not set a UI layout,
        // it just shows a toast on creation.

        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_LONG).show()
    }
}
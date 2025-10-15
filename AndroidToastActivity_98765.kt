package com.example.myapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class AndroidToastActivity_98765 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // The activity doesn't define a UI layout, so we just display the toast and finish.
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_LONG).show()
        finish() // Close the activity after showing the toast
    }
}
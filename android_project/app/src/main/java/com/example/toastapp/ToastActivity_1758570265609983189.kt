package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton
import java.util.*

class ToastActivity_1758570265609983189 : AppCompatActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Create a button programmatically
        val button = AppCompatButton(this).apply {
            text = "Show Toast"
            setOnClickListener {
                // Generate a random message
                val messages = arrayOf(
                    "Hello from Kotlin!",
                    "Have a great day!",
                    "Keep coding!",
                    "Android is awesome!",
                    "Toast message displayed!"
                )
                val randomMessage = messages[Random().nextInt(messages.size)]
                
                // Display the toast
                Toast.makeText(this@ToastActivity_1758570265609983189, randomMessage, Toast.LENGTH_SHORT).show()
            }
        }
        
        // Set the button as the content view
        setContentView(button)
    }
}
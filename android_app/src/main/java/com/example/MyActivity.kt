package com.example

import android.app.Activity
import android.os.Bundle
import android.widget.Toast

class MyActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // Assuming a basic layout

        val toastMessage = "Hello from MyActivity!"
        Toast.makeText(this, toastMessage, Toast.LENGTH_SHORT).show()
    }
}
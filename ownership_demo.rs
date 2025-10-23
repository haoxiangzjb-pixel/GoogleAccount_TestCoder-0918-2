// Rust Ownership Demo
// This code demonstrates the core concept of ownership in Rust

fn main() {
    println!("=== Rust Ownership Demo ===\n");

    // Example 1: Basic ownership transfer
    println!("1. Basic ownership transfer:");
    let s1 = String::from("hello");
    println!("s1 = {}", s1);

    let s2 = s1; // s1's ownership is moved to s2
    // println!("s1 = {}", s1); // This would cause a compile error!
    println!("s2 = {}", s2);
    println!("s1 is no longer valid after the move\n");

    // Example 2: Function ownership transfer
    println!("2. Function ownership transfer:");
    let s3 = String::from("world");
    println!("Before function call - s3 = {}", s3);
    
    take_ownership(s3); // s3's ownership is moved to the function
    // println!("After function call - s3 = {}", s3); // This would cause a compile error!
    println!("s3 is no longer valid after passing to function\n");

    // Example 3: Function returning ownership
    println!("3. Function returning ownership:");
    let s4 = String::from("Rust");
    println!("Before function call - s4 = {}", s4);
    
    let s5 = give_ownership(s4); // s4 is moved to function, which returns ownership to s5
    println!("After function call - s5 = {}", s5);
    println!("s4 is no longer valid after passing to function\n");

    // Example 4: Borrowing (not transferring ownership)
    println!("4. Borrowing (reference):");
    let s6 = String::from("borrowed");
    println!("s6 = {}", s6);
    
    let len = calculate_length(&s6); // &s6 creates a reference to s6
    println!("The length of '{}' is {}.", s6, len); // s6 is still valid here
    println!("s6 is still valid because we only borrowed it\n");

    // Example 5: Mutable borrowing
    println!("5. Mutable borrowing:");
    let mut s7 = String::from("hello");
    println!("Before mutation - s7 = {}", s7);
    
    change(&mut s7); // Pass a mutable reference
    println!("After mutation - s7 = {}", s7);
    println!("s7 was modified through a mutable reference\n");

    // Example 6: Demonstrating scope and drop
    println!("6. Scope and automatic cleanup:");
    {
        let s8 = String::from("scoped");
        println!("Inside scope - s8 = {}", s8);
    } // s8 goes out of scope here and is automatically dropped
    println!("s8 was automatically cleaned up when it went out of scope\n");

    println!("=== End of Ownership Demo ===");
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("Inside take_ownership function: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that gives ownership of a String back to caller
fn give_ownership(some_string: String) -> String {
    println!("Inside give_ownership function: {}", some_string);
    some_string // Return ownership to caller
}

// Function that borrows a reference to a String (no ownership transfer)
fn calculate_length(s: &String) -> usize {
    s.len() // We can use s here, but we don't own it
} // s goes out of scope, but since we don't own it, nothing happens

// Function that mutably borrows a String
fn change(some_string: &mut String) {
    some_string.push_str(", world!"); // Modify the original string through the mutable reference
}
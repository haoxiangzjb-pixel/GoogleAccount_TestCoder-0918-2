// Rust Ownership Demo
// This program demonstrates the key concepts of Rust ownership:
// 1. Each value has a single owner
// 2. When the owner goes out of scope, the value is dropped
// 3. There can only be one owner at a time

fn main() {
    // Example 1: Basic ownership transfer
    println!("=== Example 1: Basic Ownership Transfer ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    
    // The following line would cause a compile error:
    // println!("{}", s1); // Error: value borrowed here after move
    
    println!("s2: {}", s2);

    // Example 2: Ownership with functions
    println!("\n=== Example 2: Ownership with Functions ===");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 is moved into the function
    
    // The following line would cause a compile error:
    // println!("{}", s3); // Error: value borrowed here after move

    let x = 5;
    makes_copy(x); // x is copied (not moved) because it's an integer (Copy trait)
    println!("x is still valid after function call: {}", x); // This works fine

    // Example 3: Returning ownership
    println!("\n=== Example 3: Returning Ownership ===");
    let s4 = gives_ownership(); // Function gives ownership to s4
    println!("String received from function: {}", s4);

    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5); // s5 is moved to function, s6 receives returned ownership
    println!("String received after transfer: {}", s6);

    // Example 4: Borrowing (not transferring ownership)
    println!("\n=== Example 4: Borrowing (References) ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7); // &s7 creates a reference to s7
    println!("The length of '{}' is {}.", s7, len); // s7 is still valid here

    // Example 5: Mutable borrowing
    println!("\n=== Example 5: Mutable Borrowing ===");
    let mut s8 = String::from("hello");
    println!("Before modification: {}", s8);
    change(&mut s8); // Pass a mutable reference
    println!("After modification: {}", s8);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("String received: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (integers implement Copy trait)
fn makes_copy(some_integer: i32) {
    println!("Integer received: {}", some_integer);
    // some_integer goes out of scope here, but since it's Copy, nothing special happens
}

// Function that gives ownership to the caller
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // Return ownership to the caller
}

// Function that takes ownership and returns it
fn takes_and_gives_back(a_string: String) -> String {
    a_string // Return ownership to the caller
}

// Function that borrows a reference (doesn't take ownership)
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference, so it doesn't take ownership
} // s goes out of scope, but since it doesn't have ownership, nothing happens

// Function that mutably borrows a reference
fn change(some_string: &mut String) {
    some_string.push_str(", world!"); // Modify the original string through the mutable reference
}
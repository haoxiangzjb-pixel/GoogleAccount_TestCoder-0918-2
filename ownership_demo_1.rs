// Rust Ownership Demo
// This program demonstrates the core concepts of Rust ownership:
// 1. Each value has a single owner
// 2. When the owner goes out of scope, the value is dropped
// 3. There can only be one owner at a time

fn main() {
    // Example 1: Basic ownership transfer
    println!("=== Example 1: Basic ownership transfer ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1's ownership is moved to s2
    // println!("{}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // Example 2: Ownership transfer with functions
    println!("\n=== Example 2: Ownership transfer with functions ===");
    let s3 = String::from("world");
    take_ownership(s3); // s3's ownership is moved to the function
    // println!("{}", s3); // This would cause a compile error!

    let x = 5;
    make_copy(x); // x is copied (not moved) because it's an integer
    println!("x is still accessible after make_copy: {}", x);

    // Example 3: Functions that return ownership
    println!("\n=== Example 3: Functions that return ownership ===");
    let s4 = String::from("hello");
    let s5 = take_and_return_ownership(s4); // s4 is moved to function, then returned to s5
    println!("s5: {}", s5);

    // Example 4: References and borrowing
    println!("\n=== Example 4: References and borrowing ===");
    let s6 = String::from("hello");
    let len = calculate_length(&s6); // &s6 creates a reference to s6
    println!("The length of '{}' is {}.", s6, len); // s6 is still valid here

    // Example 5: Mutable references
    println!("\n=== Example 5: Mutable references ===");
    let mut s7 = String::from("hello");
    println!("Before change: {}", s7);
    change(&mut s7); // Pass a mutable reference
    println!("After change: {}", s7);

    // Example 6: Multiple immutable references or one mutable reference
    println!("\n=== Example 6: Borrowing rules ===");
    let mut s8 = String::from("hello");
    
    // Multiple immutable references are allowed
    let r1 = &s8;
    let r2 = &s8;
    println!("r1: {}, r2: {}", r1, r2);
    
    // A mutable reference is allowed when no immutable references exist
    let r3 = &mut s8;
    println!("r3: {}", r3);
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (not ownership transfer)
fn make_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer goes out of scope here, but nothing special happens
}

// Function that takes ownership and returns it
fn take_and_return_ownership(some_string: String) -> String {
    println!("Processing: {}", some_string);
    some_string // Return ownership to the caller
}

// Function that borrows a reference (doesn't take ownership)
fn calculate_length(s: &String) -> usize {
    s.len() // s is a reference so it doesn't own the value
} // s goes out of scope here, but since it doesn't have ownership, nothing happens

// Function that modifies a mutable reference
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}
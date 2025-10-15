// Rust Ownership Demo
// This program demonstrates the three core rules of Rust ownership:
// 1. Each value in Rust has a variable that's called its owner
// 2. There can only be one owner at a time
// 3. When the owner goes out of scope, the value will be dropped

fn main() {
    // Example 1: Basic ownership transfer
    println!("=== Example 1: Basic ownership transfer ===");
    let s1 = String::from("hello");
    let s2 = s1; // s1's ownership is moved to s2
    // println!("{}", s1); // This would cause a compile error!
    println!("s2: {}", s2);

    // Example 2: Function ownership transfer
    println!("\n=== Example 2: Function ownership transfer ===");
    let s3 = String::from("world");
    take_ownership(s3); // s3's ownership is moved to the function
    // println!("{}", s3); // This would cause a compile error!

    let x = 5;
    make_copy(x); // x is copied (not moved) because it's an integer
    println!("x is still available after function call: {}", x);

    // Example 3: Returning ownership
    println!("\n=== Example 3: Returning ownership ===");
    let s4 = String::from("hello");
    let s5 = gives_ownership(s4); // s4 is moved to function, s5 receives ownership
    // println!("{}", s4); // This would cause a compile error!
    println!("s5 received ownership: {}", s5);

    let s6 = String::from("world");
    let (s7, len) = calculate_length(s6); // s6 is moved to function, s7 receives ownership
    // println!("{}", s6); // This would cause a compile error!
    println!("s7 received ownership: {}, length: {}", s7, len);

    // Example 4: References and borrowing
    println!("\n=== Example 4: References and borrowing ===");
    let s8 = String::from("Rust");
    let len = calculate_length_with_reference(&s8); // &s8 creates a reference to s8
    println!("s8: {}, length: {}", s8, len); // s8 is still valid here

    // Example 5: Mutable references
    println!("\n=== Example 5: Mutable references ===");
    let mut s9 = String::from("hi");
    println!("Before modification: {}", s9);
    change_string(&mut s9); // Pass a mutable reference
    println!("After modification: {}", s9);

    // Example 6: Multiple references rules
    println!("\n=== Example 6: Reference rules ===");
    let mut s10 = String::from("hello");
    
    // Multiple immutable references are allowed
    let r1 = &s10;
    let r2 = &s10;
    println!("r1: {}, r2: {}", r1, r2);
    
    // But we can't have a mutable reference while immutable references exist
    // let r3 = &mut s10; // This would cause a compile error!
    
    // After immutable references go out of scope, we can create a mutable reference
    {
        let r1 = &s10;
        let r2 = &s10;
        println!("Inside scope - r1: {}, r2: {}", r1, r2);
    } // r1 and r2 go out of scope here
    
    let r3 = &mut s10; // Now this is allowed
    println!("r3 (mutable): {}", r3);
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("Received ownership of: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that makes a copy of an integer (Copy type)
fn make_copy(some_integer: i32) {
    println!("Received a copy of: {}", some_integer);
    // some_integer goes out of scope, but since it's Copy, nothing special happens
}

// Function that takes ownership and returns it
fn gives_ownership(some_string: String) -> String {
    some_string // Return ownership to the caller
}

// Function that takes ownership and returns both the string and its length
fn calculate_length(s: String) -> (String, usize) {
    let length = s.len();
    (s, length) // Return both the string and its length
}

// Function that takes a reference to a string (borrowing)
fn calculate_length_with_reference(s: &String) -> usize {
    s.len() // We can use the string but don't own it
} // s goes out of scope, but since we don't own it, nothing happens

// Function that takes a mutable reference
fn change_string(some_string: &mut String) {
    some_string.push_str(", world!");
}
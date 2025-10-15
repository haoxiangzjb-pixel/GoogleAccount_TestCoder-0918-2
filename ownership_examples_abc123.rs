// Rust Ownership Examples
// Demonstrates key ownership concepts in Rust

fn main() {
    println!("=== Rust Ownership Examples ===\n");

    // Example 1: Ownership transfer
    println!("1. Ownership Transfer:");
    let original = String::from("Hello");
    let transferred = original;  // Ownership moves from original to transferred
    // println!("{}", original); // This would cause a compile-time error!
    println!("   Transferred value: {}", transferred);

    // Example 2: Clone vs Move
    println!("\n2. Clone vs Move:");
    let source = String::from("World");
    let cloned = source.clone();  // Deep copy, both variables remain valid
    println!("   Source: {}", source);
    println!("   Cloned: {}", cloned);

    // Example 3: Functions and Ownership
    println!("\n3. Functions and Ownership:");
    let data = String::from("Owned data");
    takes_ownership(data);  // data is moved into the function
    // println!("{}", data); // This would cause a compile-time error!

    let number = 42;  // i32 implements Copy trait
    makes_copy(number);  // number is copied, not moved
    println!("   Number still accessible after function call: {}", number);

    // Example 4: Returning Ownership
    println!("\n4. Returning Ownership:");
    let returned = returns_ownership();
    println!("   Returned string: {}", returned);

    // Example 5: Borrowing
    println!("\n5. Borrowing (References):");
    let borrow_source = String::from("Borrowed");
    let length = get_length(&borrow_source);  // & creates a reference
    println!("   String: '{}', Length: {}", borrow_source, length);  // borrow_source still valid

    // Example 6: Mutable Borrowing
    println!("\n6. Mutable Borrowing:");
    let mut mutable_string = String::from("Mutable");
    println!("   Before: {}", mutable_string);
    add_exclamation(&mut mutable_string);  // Pass mutable reference
    println!("   After: {}", mutable_string);

    // Example 7: Borrowing Rules
    println!("\n7. Borrowing Rules:");
    let mut rules_example = String::from("Borrowing");
    
    // Multiple immutable references are allowed
    let ref1 = &rules_example;
    let ref2 = &rules_example;
    println!("   Immutable refs: '{}' and '{}'", ref1, ref2);
    
    // But only one mutable reference allowed at a time
    let ref3 = &mut rules_example;
    println!("   Mutable ref: '{}'", ref3);
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("   Function received: {}", some_string);
    // some_string goes out of scope here and is dropped
}

// Function that works with a copy (i32 implements Copy trait)
fn makes_copy(some_integer: i32) {
    println!("   Function received integer: {}", some_integer);
    // some_integer goes out of scope but is copied, so no ownership transfer
}

// Function that returns ownership
fn returns_ownership() -> String {
    let s = String::from("Returned from function");
    s  // Return ownership to caller
}

// Function that borrows a reference (doesn't take ownership)
fn get_length(s: &String) -> usize {
    s.len()  // Returns length without taking ownership
}

// Function that modifies through a mutable reference
fn add_exclamation(s: &mut String) {
    s.push_str("!");
}
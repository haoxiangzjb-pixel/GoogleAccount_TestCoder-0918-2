fn main() {
    // --- Ownership Demo ---

    // 1. Variable Binding and Ownership
    println!("--- 1. Variable Binding and Ownership ---");
    let s1 = String::from("Hello"); // `s1` owns the string data
    println!("s1: {}", s1);

    // 2. Move Semantics
    println!("\n--- 2. Move Semantics ---");
    let s2 = s1; // The ownership of the string data is moved from `s1` to `s2`
    // println!("s1: {}", s1); // This would cause a compile-time error!
    println!("s2: {}", s2);
    println!("s1 is no longer valid after the move.");

    // 3. Ownership and Functions
    println!("\n--- 3. Ownership and Functions ---");
    let s3 = String::from("World");
    println!("Before function call, s3: {}", s3);
    takes_ownership(s3); // Ownership of `s3` is moved into the function
    // println!("After function call, s3: {}", s3); // This would cause a compile-time error!

    let x = 5; // Integer types implement the `Copy` trait
    println!("Before function call, x: {}", x);
    makes_copy(x); // `x` is copied, not moved
    println!("After function call, x: {}", x); // This is fine because `x` was copied

    // 4. Returning Values and Ownership
    println!("\n--- 4. Returning Values and Ownership ---");
    let s4 = String::from("Hello");
    println!("Before function call, s4: {}", s4);
    let (s5, len) = calculate_length(s4); // `s4` is moved into the function, and `s5` receives the returned ownership
    println!("After function call, s5: {}, length: {}", s5, len);
    // println!("s4: {}", s4); // This would cause a compile-time error!

    // 5. References and Borrowing
    println!("\n--- 5. References and Borrowing ---");
    let s6 = String::from("Rust");
    let len_ref = calculate_length_ref(&s6); // A reference to `s6` is passed, no ownership is transferred
    println!("The length of '{}' is {}.", s6, len_ref); // `s6` is still valid here
}

// Function that takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("The string value '{}' is now owned by `takes_ownership` and will be freed at the end of the function.", some_string);
}

// Function that takes a copy of a Copy type
fn makes_copy(some_integer: i32) {
    println!("The integer value '{}' is copied when passed to `makes_copy`.", some_integer);
}

// Function that takes ownership and returns ownership
fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // `len()` returns the size of the string in bytes
    (s, length) // Return the String and its length
}

// Function that takes a reference to avoid taking ownership
fn calculate_length_ref(s: &String) -> usize {
    s.len() // `s` is a reference, so it does not own the value. It will not be freed when it goes out of scope.
}
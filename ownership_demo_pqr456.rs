fn main() {
    // --- Ownership Transfer (Move Semantics) ---
    println!("--- Ownership Transfer (Move Semantics) ---");
    let s1 = String::from("hello"); // s1 owns the string "hello"
    println!("s1 is created and owns 'hello': {}", s1);

    let s2 = s1; // Ownership of the data in s1 is moved to s2
                 // s1 is no longer valid and Rust prevents its use
    println!("Ownership of 'hello' has been moved to s2: {}", s2);
    // println!("s1 is now invalid and cannot be used: {}", s1); // This would cause a compile-time error

    // --- Functions and Ownership ---
    println!("\n--- Functions and Ownership ---");
    let s3 = String::from("world");
    println!("s3 is created: {}", s3);

    takes_ownership(s3); // Ownership of the value in s3 is moved into the function
    // println!("s3 is no longer valid here after the function call: {}", s3); // This would cause a compile-time error

    let x = 5; // Integer values have the Copy trait
    println!("x is created (Copy type): {}", x);

    makes_copy(x); // The value of x is copied into the function
    println!("x is still valid after the function call because it was copied: {}", x);

    // --- Return Values and Scope ---
    println!("\n--- Return Values and Scope ---");
    let s4 = gives_ownership(); // The function gives ownership of its returned value to s4
    println!("s4 received ownership from gives_ownership(): {}", s4);

    let s5 = String::from("rust");
    println!("s5 is created: {}", s5);

    let s6 = takes_and_gives_back(s5); // Takes ownership of s5, then returns ownership to s6
    // s5 is no longer valid here
    println!("s6 received ownership from takes_and_gives_back(): {}", s6);
    // s5 is no longer valid here either
}

// This function takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("This function took ownership and will print: {}", some_string);
    // some_string goes out of scope here and `drop` is called
    // The memory is freed
}

// This function takes a Copy type (like an integer)
fn makes_copy(some_integer: i32) {
    println!("This function took a copy of an integer and will print: {}", some_integer);
    // some_integer goes out of scope here, but nothing happens
    // because integers implement the Copy trait
}

// This function gives ownership of a new String to the caller
fn gives_ownership() -> String {
    let some_string = String::from("hello from gives_ownership");
    some_string // The value is returned and ownership is transferred to the calling function
}

// This function takes ownership of a String and then returns it
fn takes_and_gives_back(a_string: String) -> String {
    println!("This function received ownership of: {}", a_string);
    a_string // The value is returned and ownership is transferred back to the calling function
}
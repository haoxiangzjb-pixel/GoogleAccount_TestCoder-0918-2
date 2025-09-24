fn main() {
    // --- Ownership Transfer (Move Semantics) ---
    println!("--- Ownership Transfer (Move Semantics) ---");
    let s1 = String::from("hello"); // s1 owns the string
    println!("s1: {}", s1);

    let s2 = s1; // Ownership of the string data is moved from s1 to s2
                 // s1 is no longer valid and Rust prevents its use
    // println!("s1: {}", s1); // This line would cause a compile-time error!
    println!("s2: {}", s2);

    // --- Cloning Data ---
    println!("\n--- Cloning Data ---");
    let s3 = String::from("world");
    let s4 = s3.clone(); // Creates a deep copy of the data, s3 and s4 both own their own data
    println!("s3: {}", s3);
    println!("s4: {}", s4);

    // --- Functions and Ownership ---
    println!("\n--- Functions and Ownership ---");
    let s5 = String::from("Rust");
    println!("Before function call, s5: {}", s5);
    takes_ownership(s5); // The value in s5 is moved into the function
    // println!("After function call, s5: {}", s5); // This would also cause a compile-time error!

    let x = 5; // i32 is a Copy type
    println!("Before function call, x: {}", x);
    makes_copy(x); // The value in x is copied into the function
    println!("After function call, x: {}", x); // This is fine, x is still valid
}

// This function takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("Inside function, received string: {}", some_string);
    // `some_string` goes out of scope here and `drop` is called.
    // The memory is freed.
}

// This function takes a Copy type, so the original value is unaffected
fn makes_copy(some_integer: i32) {
    println!("Inside function, received integer: {}", some_integer);
    // `some_integer` goes out of scope, but nothing happens as it's a Copy type.
}
fn main() {
    // --- Ownership Demo ---

    // 1. Ownership transfer with assignment
    println!("--- Ownership Transfer ---");
    let s1 = String::from("hello"); // s1 owns the string
    println!("s1: {}", s1);
    let s2 = s1; // Ownership of the string data is moved from s1 to s2
    // println!("s1: {}", s1); // This would cause a compile-time error because s1 no longer owns the data
    println!("s2: {}", s2);

    // 2. Ownership transfer with function call
    println!("\n--- Ownership Transfer to Function ---");
    let s3 = String::from("world");
    println!("s3 before function call: {}", s3);
    take_ownership(s3); // Ownership of the string data is moved into the function
    // println!("s3 after function call: {}", s3); // This would cause a compile-time error

    // 3. Ownership return from function
    println!("\n--- Ownership Return from Function ---");
    let s4 = String::from("rust");
    println!("s4 before function call: {}", s4);
    let s5 = take_and_give_back(s4); // Ownership is moved into the function and then returned
    println!("s5 after function call: {}", s5);

    // 4. Borrowing (does not transfer ownership)
    println!("\n--- Borrowing ---");
    let s6 = String::from("borrowing");
    println!("s6 before function call: {}", s6);
    let len = calculate_length(&s6); // &s6 creates a reference to s6, not transferring ownership
    println!("The length of '{}' is {}.", s6, len); // s6 is still valid here
}

// Function that takes ownership of a String
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // `some_string` goes out of scope here, and the memory is freed
}

// Function that takes ownership and returns it
fn take_and_give_back(a_string: String) -> String {
    println!("Received string: {}", a_string);
    a_string // Return ownership of the string back to the caller
}

// Function that borrows a reference to a String, does not take ownership
fn calculate_length(s: &String) -> usize {
    s.len() // We can use the reference `s` but do not own it
} // `s` goes out of scope, but since it doesn't own the data, nothing happens to the original String

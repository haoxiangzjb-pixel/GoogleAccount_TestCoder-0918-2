fn main() {
    // --- Ownership and Functions ---
    println!("=== Ownership and Functions ===");
    
    let s = String::from("hello");  // s comes into scope
    println!("Initial string: {}", s);

    takes_ownership(s);             // s's value moves into the function...
    // println!("{}", s);          // ... so it's no longer valid here, this would cause an error!

    let x = 5;                      // x comes into scope
    println!("Initial integer: {}", x);

    makes_copy(x);                  // x would move into the function,
    println!("Integer after function call: {}", x); // but i32 is Copy, so it's still valid here!
    
    // --- Return Values and Scope ---
    println!("\n=== Return Values and Scope ===");
    
    let s1 = gives_ownership();         // gives_ownership moves its return value into s1
    println!("String received from function: {}", s1);

    let s2 = String::from("hello");     // s2 comes into scope
    println!("Initial string for function: {}", s2);
    
    let s3 = takes_and_gives_back(s2);  // s2 is moved into takes_and_gives_back, which also moves its return value into s3
    println!("String received from second function: {}", s3);
    // s2 is no longer valid here because it was moved!
    
    // --- References and Borrowing ---
    println!("\n=== References and Borrowing ===");
    
    let s4 = String::from("hello");
    let len = calculate_length(&s4); // &s4 creates a reference to s4, but does not take ownership
    println!("The length of '{}' is {}.", s4, len); // s4 is still valid here because we only borrowed it
}

// This function takes ownership of a String
fn takes_ownership(some_string: String) {
    println!("String inside function (will be dropped): {}", some_string);
} // Here, some_string goes out of scope and `drop` is called. The memory is freed.

// This function takes an i32 which is a Copy type, so it's copied, not moved
fn makes_copy(some_integer: i32) {
    println!("Integer inside function: {}", some_integer);
} // Here, some_integer goes out of scope. Nothing special happens.

// This function gives away ownership of a new String
fn gives_ownership() -> String {
    let some_string = String::from("yours"); // some_string comes into scope
    some_string                               // some_string is returned and moves out to the calling function
}

// This function takes a String and returns one
fn takes_and_gives_back(a_string: String) -> String {
    println!("Processing string inside function: {}", a_string);
    a_string  // a_string is returned and moves out to the calling function
}

// This function takes a reference to a String, not ownership
fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len() // len() returns the length of the string
} // Here, s goes out of scope. But because it did not have ownership of what
  // it refers to, nothing happens.
fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Basic Ownership Transfer ---");
    {
        let s1 = String::from("hello"); // s1 owns the String
        println!("s1: {}", s1);

        // Ownership of the String value is moved from s1 to s2.
        // s1 is no longer valid after this point.
        let s2 = s1;

        // The following line would cause a compile-time error:
        // println!("s1: {}", s1); // Error: value borrowed here after move

        println!("s2: {}", s2); // s2 is now the owner
        // When this scope ends, s2 is dropped.
    }

    println!("\n--- Function Ownership Transfer ---");
    {
        let s3 = String::from("world");
        println!("s3 before function call: {}", s3);

        // Ownership of the String in s3 is moved into the function `takes_ownership`.
        takes_ownership(s3);

        // The following line would cause a compile-time error:
        // println!("s3 after function call: {}", s3); // Error: value borrowed here after move

        let x = 5; // Integer types implement the `Copy` trait, so they are copied, not moved.
        println!("x before function call: {}", x);

        makes_copy(x); // x is copied into the function `makes_copy`.

        println!("x after function call: {}", x); // This is fine, x is still valid.
    }

    println!("\n--- Returning Ownership ---");
    {
        let s4 = String::from("hello");
        println!("s4 before function: {}", s4);

        // The function `gives_ownership` takes ownership of s4 and then returns it.
        // The returned value is assigned to s5, transferring ownership back.
        let s5 = gives_ownership(s4);

        // The following line would cause a compile-time error:
        // println!("s4 after function: {}", s4); // Error: value borrowed here after move

        println!("s5 after function: {}", s5);
    }

    println!("\n--- Borrowing (References) ---");
    {
        let s6 = String::from("hello");
        println!("s6: {}", s6);

        // We pass a reference to the String, not the String itself.
        // `calculate_length` borrows `s6`, it does not take ownership.
        let len = calculate_length(&s6);

        // `s6` is still valid here because we only borrowed it.
        println!("The length of '{}' is {}.", s6, len);
    }

    println!("\n--- Mutable Borrowing ---");
    {
        let mut s7 = String::from("hello");
        println!("s7 before mutable borrow: {}", s7);

        // We pass a mutable reference to the String.
        change(&mut s7);

        // `s7` is modified and still valid.
        println!("s7 after mutable borrow: {}", s7);
    }
}

// This function takes ownership of a String.
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // `some_string` goes out of scope here and `drop` is called.
    // The memory is freed.
}

// This function takes a copy of an integer (i32 implements Copy).
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // `some_integer` goes out of scope, but since it's `Copy`, nothing special happens.
}

// This function takes ownership of a String and returns it.
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    // `some_string` is returned, transferring ownership to the calling function.
    some_string
}

// This function takes a reference to a String.
// It borrows the value without taking ownership.
fn calculate_length(s: &String) -> usize {
    s.len() // `len()` returns the length of the string.
    // `s` goes out of scope, but since it does not have ownership of what
    // it refers to, nothing happens.
}

// This function takes a mutable reference to a String.
fn change(some_string: &mut String) {
    some_string.push_str(", world"); // Appends ", world" to the string.
    // `some_string` goes out of scope, but the String it borrowed is modified.
}
fn main() {
    // --- Ownership Transfer (Move Semantics) ---
    println!("--- Ownership Transfer ---");
    let s1 = String::from("hello");
    println!("Initial owner s1: {}", s1);

    // The ownership of the String value is moved from s1 to s2.
    // After this, s1 is no longer valid and cannot be used.
    let s2 = s1;
    // println!("Original owner s1: {}", s1); // This would cause a compile-time error!
    println!("New owner s2: {}", s2);

    // --- Functions and Ownership ---
    println!("\n--- Functions and Ownership ---");
    let s3 = String::from("world");
    println!("Before function call, s3: {}", s3);
    // Ownership of the value in s3 is moved into the function `takes_ownership`.
    takes_ownership(s3);

    // s3 is no longer valid here.
    // println!("After function call, s3: {}", s3); // This would cause a compile-time error!

    let x = 5; // i32 is Copy, so it behaves differently.
    println!("Before function call, x: {}", x);
    makes_copy(x); // The value in x is copied to the function `makes_copy`.
    // x is still valid here because i32 implements the Copy trait.
    println!("After function call, x: {}", x);

    // --- Borrowing ---
    println!("\n--- Borrowing ---");
    let s4 = String::from("hello");
    println!("String to borrow: {}", s4);
    // We pass a reference to s4, not the value itself.
    // The function `calculate_length` borrows the string.
    let len = calculate_length(&s4);
    // s4 is still valid here because we only borrowed it.
    println!("The length of '{}' is {}.", s4, len);

    // --- Mutable Borrowing ---
    println!("\n--- Mutable Borrowing ---");
    let mut s5 = String::from("hi");
    println!("Before mutable borrow: {}", s5);
    // We pass a mutable reference to s5.
    change(&mut s5);
    // s5 is still valid and has been modified.
    println!("After mutable borrow: {}", s5);

    // --- Slices ---
    println!("\n--- Slices ---");
    let s6 = String::from("Hello, world!");
    println!("Original string: {}", s6);
    // We pass the string to a function that returns a slice.
    let word = first_word(&s6);
    println!("The first word is '{}'", word);
}

fn takes_ownership(some_string: String) {
    // `some_string` comes into scope and is now the owner.
    println!("Received string (ownership taken): {}", some_string);
    // `some_string` goes out of scope and `drop` is called.
    // The memory is freed.
}

fn makes_copy(some_integer: i32) {
    // `some_integer` comes into scope.
    println!("Received integer (copied): {}", some_integer);
    // `some_integer` goes out of scope. Nothing special happens.
}

fn calculate_length(s: &String) -> usize {
    // `s` is a reference to a String.
    // It does not own the value.
    s.len()
    // `s` goes out of scope, but since it doesn't own the value,
    // nothing happens to the original String.
}

fn change(some_string: &mut String) {
    // `some_string` is a mutable reference.
    some_string.push_str(", world");
    // The original String is modified.
}

fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}
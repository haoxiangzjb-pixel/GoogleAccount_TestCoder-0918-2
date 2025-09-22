// This program demonstrates Rust's ownership concept.
// It shows move semantics, borrowing, and references.

fn main() {
    // 1. Ownership and Move Semantics
    println!("--- Ownership and Move ---");
    let s1 = String::from("hello"); // s1 owns the string data
    let s2 = s1; // s1 is moved to s2. s1 is no longer valid.
    
    // println!("{}", s1); // This would cause a compile-time error.
    println!("s2 owns the string: {}", s2); // This is valid.

    // 2. Clone (Deep Copy)
    println!("\n--- Clone (Deep Copy) ---");
    let s3 = s2.clone(); // Creates a deep copy of the data in s2
    println!("s2: {}, s3: {}", s2, s3); // Both s2 and s3 are now valid.

    // 3. Copy Trait (for stack-allocated data)
    println!("\n--- Copy Trait ---");
    let x = 5; // i32 implements the Copy trait
    let y = x; // x is copied, not moved.
    println!("x: {}, y: {}", x, y); // Both x and y are valid.

    // 4. Borrowing and References
    println!("\n--- Borrowing and References ---");
    let s4 = String::from("world");
    let len = calculate_length(&s4); // &s4 creates a reference to s4, but does not transfer ownership.
    println!("The length of '{}' is {}.", s4, len); // s4 is still valid here.

    // 5. Mutable References
    println!("\n--- Mutable References ---");
    let mut s5 = String::from("hello");
    println!("Before: {}", s5);
    change(&mut s5); // &mut s5 creates a mutable reference.
    println!("After: {}", s5);

    // 6. Reference Rules
    // a) You can have as many immutable references as you want.
    let mut s6 = String::from("rules");
    let r1 = &s6;
    let r2 = &s6;
    println!("Immutable refs: {}, {}", r1, r2);
    
    // b) You can have only one mutable reference (and no immutable refs) in a scope.
    let r3 = &mut s6;
    // let r4 = &mut s6; // This would be a compile-time error.
    println!("Mutable ref: {}", r3);
    
    // c) References must always be valid (no dangling references).
    // The following function is commented out because it tries to return a dangling reference.
    // let reference_to_nothing = dangle();
}

fn calculate_length(s: &String) -> usize { // s is a reference to a String
    s.len()
    // s goes out of scope here, but because it does not own the data, nothing happens.
}

fn change(s: &mut String) { // s is a mutable reference to a String
    s.push_str(", world");
    // s goes out of scope here.
}

// fn dangle() -> &String { // This function's signature is problematic.
//     let s = String::from("dangle");
//     &s // We return a reference to s.
//     // s goes out of scope here and is dropped. The returned reference would point to invalid data.
// }
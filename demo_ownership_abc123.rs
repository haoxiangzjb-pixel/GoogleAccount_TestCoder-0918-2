fn main() {
    // --- Ownership Rules Demonstration ---

    // 1. Each value in Rust has a variable that's called its owner.
    // 2. There can only be one owner at a time.
    // 3. When the owner goes out of scope, the value will be dropped.

    println!("--- Basic Ownership Transfer ---");
    {
        let s1 = String::from("hello"); // s1 owns the String
        println!("s1: {}", s1);

        let s2 = s1; // Ownership of the String is moved from s1 to s2
        // s1 is no longer valid here, the compiler prevents its use.

        // println!("s1: {}", s1); // This would cause a compile-time error!
        println!("s2: {}", s2); // s2 is the new owner

        // When this inner scope ends, s2 goes out of scope and its String is dropped.
    } // s1 would also go out of scope here if it were still valid, causing a double-free error.

    println!("\n--- Ownership and Functions ---");
    {
        let s3 = String::from("world");
        println!("Before function call, s3: {}", s3);

        // The value of s3 is moved into the function `takes_ownership`.
        takes_ownership(s3);

        // s3 is no longer valid here because ownership was transferred.
        // println!("After function call, s3: {}", s3); // This would cause a compile-time error!

        let x = 5; // x is an integer, which is Copy.
        println!("Before function call, x: {}", x);

        // The value of x is copied into the function `makes_copy`.
        makes_copy(x);

        // x is still valid here because it was copied, not moved.
        println!("After function call, x: {}", x);
    }

    println!("\n--- Return Values and Ownership ---");
    {
        let s4 = gives_ownership(); // Function moves its return value into s4.
        println!("After giving ownership, s4: {}", s4);

        let s5 = String::from("rust");
        println!("Before giving ownership, s5: {}", s5);

        // The value of s5 is moved to the function, and the function returns a new value,
        // which is then moved to s6.
        let s6 = takes_and_gives_back(s5);
        println!("After taking and giving back, s6: {}", s6);

        // s5 is no longer valid here.
    }
}

// This function takes ownership of a String. The String will be dropped when this function ends.
fn takes_ownership(some_string: String) {
    println!("Inside function `takes_ownership`: {}", some_string);
    // `some_string` goes out of scope here and the heap memory is freed.
}

// This function receives an integer, which is a Copy type. The original value is unaffected.
fn makes_copy(some_integer: i32) {
    println!("Inside function `makes_copy`: {}", some_integer);
    // `some_integer` goes out of scope here, but nothing happens because i32 is Copy.
}

// This function gives away ownership of a new String.
fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string // The value of `some_string` is moved out to the calling function.
}

// This function takes ownership of a String and then returns it.
fn takes_and_gives_back(a_string: String) -> String {
    println!("Inside function `takes_and_gives_back`: {}", a_string);
    a_string // The ownership of `a_string` is moved out to the calling function.
}
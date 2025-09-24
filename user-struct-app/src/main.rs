// This is the main Rust source file defining the User struct.

/// A simple struct representing a User.
struct User {
    /// The name of the user.
    name: String,
    /// The age of the user.
    age: u32,
}

fn main() {
    // Example usage of the User struct.
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("Created user: {}, age {}", user.name, user.age);
}
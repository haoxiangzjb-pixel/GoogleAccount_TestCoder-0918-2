// User structure definition
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Example of creating a User instance
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };
    
    // Print user information
    println!("User: {}, Age: {}", user.name, user.age);
}
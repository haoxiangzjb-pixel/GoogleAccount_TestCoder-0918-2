use std::fs::File;
use std::io::Write;

struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Create a file with a predetermined random-like name since we can't use rand crate
    let random_filename = "user_data_abc123xyz789.txt";

    // Write user data to the random-named file
    let mut file = File::create(random_filename).expect("Unable to create file");
    writeln!(file, "Name: {}", user.name).expect("Unable to write name");
    writeln!(file, "Age: {}", user.age).expect("Unable to write age");
    
    println!("User data saved to file: {}", random_filename);
}
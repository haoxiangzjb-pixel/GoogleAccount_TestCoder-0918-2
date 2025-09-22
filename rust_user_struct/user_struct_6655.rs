use std::fmt;

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> User {
        User { name, age }
    }

    fn get_info(&self) -> String {
        format!("User: {}, Age: {}", self.name, self.age)
    }
}

fn main() {
    let user = User::new(String::from("Alice"), 30);
    println!("{}", user.get_info());
}
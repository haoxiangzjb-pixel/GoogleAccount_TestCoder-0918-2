pub struct User {
    pub name: String,
    pub age: u32,
}

fn main() {
    let user = User {
        name: String::from("John Doe"),
        age: 30,
    };
    
    println!("User: {}, Age: {}", user.name, user.age);
}
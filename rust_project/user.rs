use std::fs::File;
use std::io::Write;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() -> std::io::Result<()> {
    let user = User {
        name: "Alice".to_string(),
        age: 30,
    };

    let start = SystemTime::now();
    let timestamp = start.duration_since(UNIX_EPOCH).expect("Time went backwards").as_nanos();
    let filename = format!("user_data_{}.txt", timestamp);

    let mut file = File::create(&filename)?;
    writeln!(file, "Name: {}", user.name)?;
    writeln!(file, "Age: {}", user.age)?;
    
    println!("User data written to file: {}", filename);

    Ok(())
}
mod user;
use user::User;

fn main() {
    let user = User::new("Alice".to_string(), 30);
    
    match user.save_to_random_file() {
        Ok(filename) => {
            println!("User saved to file: {}", filename);
        },
        Err(e) => {
            eprintln!("Error saving user: {}", e);
        }
    }
}
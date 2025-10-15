use serde::{Serialize, Deserialize};
use std::fs::File;
use std::io::Write;
use uuid::Uuid;

#[derive(Serialize, Deserialize, Debug)]
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    pub fn new(name: String, age: u32) -> Self {
        User { name, age }
    }

    pub fn save_to_random_file(&self) -> Result<String, Box<dyn std::error::Error>> {
        let random_filename = format!("user_{}.json", Uuid::new_v4());
        let json_data = serde_json::to_string(self)?;
        let mut file = File::create(&random_filename)?;
        file.write_all(json_data.as_bytes())?;
        Ok(random_filename)
    }
}
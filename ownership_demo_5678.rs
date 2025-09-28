fn main() {
    // 基本所有权转移示例
    println!("--- Ownership Transfer ---");
    let s1 = String::from("hello");
    let s2 = s1; // s1 的所有权被移动到 s2，s1 不再有效

    // println!("{}", s1); // 这行如果取消注释会报错，因为 s1 已被移动
    println!("s2 is {}", s2);

    // 函数所有权示例
    println!("\n--- Ownership in Functions ---");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内

    // println!("{}", s3); // 这行如果取消注释会报错，因为 s3 已被移动
    let x = 5;
    makes_copy(x); // i32 实现了 Copy trait，所以 x 被复制，原值仍然有效
    println!("x is still usable after function call: {}", x);
}

// 这个函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("The string value '{}' is now owned by this function and will be freed when the function ends.", some_string);
} // some_string 在这里离开作用域并被丢弃

// 这个函数接收一个 Copy 类型，不会获取所有权
fn makes_copy(some_integer: i32) {
    println!("The integer value '{}' is copied, so the original is still valid.", some_integer);
} // some_integer 在这里离开作用域，但因为是 Copy 类型，所以没有特殊操作
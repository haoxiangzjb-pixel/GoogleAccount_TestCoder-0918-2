// Rust 所有权演示

fn main() {
    // 1. 变量绑定到值时获得所有权
    let s1 = String::from("hello");
    println!("s1: {}", s1);

    // 2. 移动语义：所有权转移
    let s2 = s1; // s1 的所有权移动到 s2，s1 不再有效
    // println!("s1: {}", s1); // 这一行会报错！因为 s1 已被移动
    println!("s2: {}", s2);

    // 3. 克隆：创建一个全新的副本，拥有独立的所有权
    let s3 = s2.clone();
    println!("s2: {}, s3: {}", s2, s3);

    // 4. 函数调用中的所有权转移
    let s4 = String::from("world");
    take_ownership(s4); // s4 的所有权被转移到函数内部
    // println!("{}", s4); // 这一行会报错！

    // 5. 函数调用中的借用
    let s5 = String::from("Rust");
    let len = calculate_length(&s5); // 传递 s5 的引用（借用），不转移所有权
    println!("The length of '{}' is {}.", s5, len); // s5 仍然有效

    // 6. 可变借用
    let mut s6 = String::from("Hello");
    change_string(&mut s6); // 传递可变引用
    println!("s6 after change: {}", s6);
}

// 此函数获取 String 的所有权
fn take_ownership(some_string: String) {
    println!("In function, got ownership: {}", some_string);
    // 函数结束时，some_string 被丢弃
}

// 此函数获取字符串的引用（借用），不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len()
    // 返回长度，s 离开作用域，但因为没有所有权，所以不丢弃 s 指向的值
}

// 此函数获取可变引用
fn change_string(s: &mut String) {
    s.push_str(", world!");
}
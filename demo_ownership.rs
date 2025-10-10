fn main() {
    // 基本类型（Copy类型）的所有权
    let x = 5;
    let y = x; // `x` 的值被复制给 `y`，`x` 仍然有效
    println!("x = {}, y = {}", x, y); // 这行代码可以正常运行

    // 字符串类型（非Copy类型）的所有权
    let s1 = String::from("hello");
    let s2 = s1; // `s1` 的所有权被移动到 `s2`，`s1` 不再有效
    println!("s2 = {}", s2);
    // println!("s1 = {}", s1); // 这行代码会导致编译错误，因为 `s1` 已经失效

    // 函数调用中的所有权转移
    let s3 = String::from("world");
    takes_ownership(s3); // `s3` 的所有权被移动到函数 `takes_ownership` 中
    // println!("{}", s3); // 这行代码会导致编译错误，因为 `s3` 已经失效

    // 函数调用中的借用
    let s4 = String::from("Rust");
    let len = calculate_length(&s4); // `s4` 被借用，所有权未转移
    println!("The length of '{}' is {}.", s4, len); // `s4` 仍然有效
}

fn takes_ownership(some_string: String) {
    // `some_string` 进入作用域
    println!("{}", some_string);
} // `some_string` 离开作用域并被 `drop` 函数处理

fn calculate_length(s: &String) -> usize { // `s` 是一个引用
    s.len()
} // `s` 离开作用域，但它所引用的对象没有被 `drop`
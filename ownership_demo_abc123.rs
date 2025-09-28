// Rust 所有权示例

fn main() {
    // 创建一个字符串
    let s1 = String::from("hello");

    // 将 s1 的所有权移动给 s2
    let s2 = s1;

    // 此时 s1 已不再有效，下面这行代码会引发编译错误
    // println!("{}", s1); // 编译错误：value borrowed here after move

    // s2 现在拥有这个字符串
    println!("s2 = {}", s2);

    // 函数调用示例
    let s3 = String::from("world");
    take_ownership(s3); // s3 的所有权被转移给函数 `take_ownership`

    // s3 在这里不再有效
    // println!("{}", s3); // 这行代码也会引发编译错误

    // 另一个函数调用示例，返回值的所有权被转移给 s4
    let s4 = gives_ownership();
    println!("s4 = {}", s4);

    // `calculate_length` 函数借用 s4，不获取所有权
    let len = calculate_length(&s4);
    println!("The length of '{}' is {}.", s4, len);
}

fn take_ownership(some_string: String) {
    println!("Taking ownership: {}", some_string);
} // some_string 在这里离开作用域并被丢弃

fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // 将 some_string 的所有权返回给调用者
}

fn calculate_length(s: &String) -> usize { // s 是一个对 String 的引用
    s.len() // 引用 s，不拥有它，所以 s 在函数结束时不会被丢弃
} // s 离开作用域，但因为它不拥有它所指向的值，所以什么也不会发生
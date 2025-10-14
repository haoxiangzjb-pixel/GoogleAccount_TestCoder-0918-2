fn main() {
    // 基本所有权转移示例
    println!("--- Ownership Transfer ---");
    let s1 = String::from("hello");
    let s2 = s1; // s1 的所有权被移动到 s2
    // println!("{}", s1); // 这行会报错，因为 s1 不再有效
    println!("s2 = {}", s2);

    // 函数所有权示例
    println!("\n--- Ownership in Functions ---");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内
    // println!("{}", s3); // 这行会报错

    let x = 5;
    makes_copy(x); // x 是 Copy 类型，值被复制
    println!("x is still valid: {}", x); // 这行可以正常运行

    // 返回值所有权示例
    println!("\n--- Ownership from Functions ---");
    let s4 = gives_ownership(); // 函数返回的值被移动给 s4
    let s5 = String::from("from main");
    let s6 = takes_and_gives_back(s5); // s5 的所有权被移入函数，然后移出给 s6
    println!("s4: {}, s6: {}", s4, s6);
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
} // some_string 在这里离开作用域并被丢弃

fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
} // some_integer 在这里离开作用域，但因为是 Copy 类型，所以没有影响

fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // 将 some_string 的所有权移出函数
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // 接收所有权，然后将其返回
}
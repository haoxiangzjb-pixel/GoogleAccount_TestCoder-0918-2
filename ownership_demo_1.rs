// Rust 所有权示例

fn main() {
    // --- 移动语义 ---
    println!("--- 移动语义 ---");
    let s1 = String::from("hello");
    let s2 = s1; // s1 的值被移动到 s2，s1 不再有效

    // println!("{}", s1); // 如果取消注释，这行代码会报错！
    println!("s2 的值是: {}", s2);

    // --- 函数中的所有权 ---
    println!("\n--- 函数中的所有权 ---");
    let s3 = String::from("world");
    takes_ownership(s3); // s3 的所有权被移动到函数内部
    // println!("{}", s3); // 如果取消注释，这行代码会报错！

    let x = 5; // i32 是 Copy 类型，行为不同
    makes_copy(x); // x 的值被复制，而不是移动
    println!("x 的值仍然是: {}", x); // 这行代码可以正常工作

    // --- 从函数返回值获取所有权 ---
    println!("\n--- 从函数返回值获取所有权 ---");
    let s4 = gives_ownership(); // gives_ownership 将返回值的所有权转移给 s4
    println!("s4 的值是: {}", s4);

    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5); // s5 被移动到函数中，函数返回的值被移动到 s6
    // println!("{}", s5); // 如果取消注释，这行代码会报错！
    println!("s6 的值是: {}", s6);
}

fn takes_ownership(some_string: String) {
    println!("被移动进来的字符串是: {}", some_string);
} // some_string 离开作用域，其内存被释放

fn makes_copy(some_integer: i32) {
    println!("被复制进来的整数是: {}", some_integer);
} // some_integer 离开作用域，但因为是 Copy 类型，所以没有特殊操作

fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 将 some_string 的所有权移出函数
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // 接收所有权，并返回该所有权
}
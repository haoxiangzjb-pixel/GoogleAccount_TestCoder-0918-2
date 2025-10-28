// Rust所有权概念演示
fn main() {
    // 1. 基本所有权转移
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2
    // println!("{}", s1);  // 这行会报错，因为s1不再有效
    println!("s2 = {}", s2);

    // 2. 函数参数的所有权转移
    println!("\n=== 函数参数的所有权转移 ===");
    let s3 = String::from("world");
    takes_ownership(s3);  // s3的所有权转移到函数内部
    // println!("{}", s3);  // 这行会报错，因为s3的所有权已经转移

    let x = 5;
    makes_copy(x);  // x是Copy类型，值被复制而不是移动
    println!("x is still available: {}", x);  // x仍然可用

    // 3. 返回值的所有权
    println!("\n=== 返回值的所有权 ===");
    let s4 = gives_ownership();  // 函数返回值的所有权转移给s4
    println!("s4 = {}", s4);
    
    let s5 = String::from("rust");
    let s6 = takes_and_gives_back(s5);  // s5的所有权转移给函数，然后返回值的所有权转移给s6
    println!("s6 = {}", s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 传递s7的引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);  // s7仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before change: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After change: {}", s8);

    // 6. 悬垂引用示例（注释掉，因为这会导致编译错误）
    // println!("\n=== 悬垂引用（演示错误） ===");
    // let reference_to_nothing = dangle();  // 这会导致编译错误
}

// 函数获取所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，值被丢弃
}

// 函数接收Copy类型的值
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但因为是Copy类型，所以不会影响原始值
}

// 函数返回所有权
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string  // 返回值的所有权转移给调用者
}

// 函数接收并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 返回值的所有权转移给调用者
}

// 函数接收引用，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len()  // s是引用，不拥有所有权，所以不会在离开作用域时被清理
}

// 函数修改可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world!");
}

// 演示悬垂引用错误（这会导致编译错误）
// fn dangle() -> &String {
//     let s = String::from("hello");
//     &s  // 尝试返回局部变量的引用，会导致悬垂引用
//     // 编译器会报错，因为s在函数结束时被释放
// }
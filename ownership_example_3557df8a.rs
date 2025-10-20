// Rust 所有权概念演示

fn main() {
    // 1. 基本的所有权转移
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2，s1不再有效
    // println!("{}", s1);  // 这行会报错，因为s1的所有权已经被转移
    println!("s2: {}", s2);

    // 2. 函数中的所有权转移
    println!("\n=== 函数中的所有权转移 ===");
    let s3 = String::from("world");
    take_ownership(s3);  // s3的所有权转移到函数内部
    // println!("{}", s3);  // 这行会报错
    
    let x = 5;
    make_copy(x);  // x是Copy类型，值被复制而不是移动
    println!("x is still available: {}", x);  // 这行可以正常运行

    // 3. 返回值的所有权
    println!("\n=== 返回值的所有权 ===");
    let s4 = gives_ownership();  // 函数返回值的所有权转移给s4
    println!("s4: {}", s4);
    
    let s5 = String::from("hello");
    let s6 = takes_and_gives_back(s5);  // s5的所有权转移给函数，函数返回值的所有权转移给s6
    println!("s6: {}", s6);

    // 4. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s7 = String::from("hello");
    let len = calculate_length(&s7);  // 传递s7的引用，不转移所有权
    println!("The length of '{}' is {}.", s7, len);  // s7仍然有效

    // 5. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s8 = String::from("hello");
    println!("Before modification: {}", s8);
    change(&mut s8);  // 传递可变引用
    println!("After modification: {}", s8);

    // 6. 悬垂引用演示（注释掉，因为这会导致编译错误）
    // let reference_to_nothing = dangle();  // 这行会导致编译错误
    let reference_to_string = no_dangle();
    println!("Got string from no_dangle: {}", reference_to_string);
}

// 函数获取String的所有权
fn take_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string在这里离开作用域，其值被丢弃(drop)
}

// 函数接收Copy类型的值（不会转移所有权）
fn make_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer在这里离开作用域，但因为i32实现了Copy trait，所以会被复制
}

// 函数返回String的所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string  // 返回值的所有权转移给调用者
}

// 函数接收所有权并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string  // 返回参数的所有权给调用者
}

// 函数接收引用，不获取所有权
fn calculate_length(s: &String) -> usize {
    s.len()  // s是引用，不拥有所有权，所以不会在离开作用域时被丢弃
}

// 函数修改可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

// 演示悬垂引用问题及解决方案
// fn dangle() -> &String {  // 这个函数会导致编译错误
//     let s = String::from("hello");
//     &s  // s在函数结束时被释放，返回其引用会导致悬垂指针
// }

fn no_dangle() -> String {  // 正确的版本
    let s = String::from("hello");
    s  // 返回String的所有权而不是引用
}
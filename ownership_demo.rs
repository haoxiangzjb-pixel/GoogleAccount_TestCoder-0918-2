// Rust 所有权概念演示

fn main() {
    // 1. 基本所有权转移
    println!("=== 基本所有权转移 ===");
    let s1 = String::from("hello");
    let s2 = s1;  // s1的所有权转移到s2，s1不再有效
    // println!("{}", s1);  // 这行会报错，因为s1已经被移动
    println!("s2: {}", s2);

    // 2. 克隆（深拷贝）
    println!("\n=== 克隆（深拷贝）===");
    let s3 = String::from("world");
    let s4 = s3.clone();  // 创建s3的完整副本，s3和s4都有效
    println!("s3: {}, s4: {}", s3, s4);

    // 3. 函数参数的所有权
    println!("\n=== 函数参数的所有权 ===");
    let s5 = String::from("hello");
    take_ownership(s5);  // s5的所有权转移到函数内部
    // println!("{}", s5);  // 这行会报错，因为s5已经失效

    let x = 5;
    make_copy(x);  // 对于整数等Copy类型，会进行复制而不是移动
    println!("x is still valid: {}", x);  // x仍然有效

    // 4. 返回值的所有权
    println!("\n=== 返回值的所有权 ===");
    let s6 = gives_ownership();  // 函数返回值的所有权转移给s6
    let s7 = String::from("test");
    let s8 = takes_and_gives_back(s7);  // 所有权转移给函数，然后返回
    println!("s6: {}, s8: {}", s6, s8);

    // 5. 引用和借用
    println!("\n=== 引用和借用 ===");
    let s9 = String::from("hello");
    let len = calculate_length(&s9);  // 传递引用，不转移所有权
    println!("The length of '{}' is {}.", s9, len);

    // 6. 可变引用
    println!("\n=== 可变引用 ===");
    let mut s10 = String::from("hello");
    println!("Before change: {}", s10);
    change(&mut s10);  // 传递可变引用
    println!("After change: {}", s10);
}

// 函数获取所有权
fn take_ownership(some_string: String) {
    println!("函数内部: {}", some_string);
    // some_string在这里离开作用域，其值被丢弃
}

// 对于Copy类型，会进行复制而不是移动
fn make_copy(some_integer: i32) {
    println!("函数内部: {}", some_integer);
    // some_integer在这里离开作用域，但因为是Copy类型，所以不会影响原始值
}

// 函数返回String的所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello");
    some_string  // 返回值的所有权转移给调用者
}

// 函数接收String的所有权并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    a_string
}

// 计算字符串长度，使用引用避免所有权转移
fn calculate_length(s: &String) -> usize {
    s.len()
    // s是引用，不拥有所有权，所以不会在离开作用域时被清理
}

// 修改字符串，使用可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获得
    let s1 = String::from("hello"); // s1 拥有字符串 "hello"
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    // 将 s1 的值移动给 s2，s1 将不再有效
    let s2 = s1;
    // println!("s1: {}", s1); // 这行代码会报错！因为 s1 的所有权已被移动
    println!("s2: {}", s2);

    // 3. 克隆 (Clone)
    // 创建一个全新的、独立的副本
    let s3 = s2.clone();
    println!("s2: {}, s3: {}", s2, s3);

    // 4. 函数与所有权
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被移动到函数内部
    // println!("{}", s4); // 这行代码会报错！因为 s4 的所有权已被移动

    let x = 5; // i32 是 Copy 类型，行为不同
    makes_copy(x); // x 的值被复制（而非移动）到函数内部
    println!("x is still available after function call: {}", x); // x 仍然可用
}

// 这个函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Function took ownership and says: {}", some_string);
} // some_string 在这里离开作用域，其内存被释放 (drop)

// 这个函数获取一个 i32 的值，i32 实现了 Copy trait
fn makes_copy(some_integer: i32) {
    println!("Function copied the integer: {}", some_integer);
} // some_integer 在这里离开作用域，但因为是 Copy 类型，所以不会影响原来的变量
// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权
    let s1 = String::from("hello"); // s1 拥有这个字符串
    println!("s1: {}", s1);

    // 2. 移动语义 (Move)
    let s2 = s1; // s1 的所有权被移动到 s2，s1 不再有效
    // println!(\"s1: {}\", s1); // 如果取消注释，这行代码会导致编译错误
    println!("s2: {}", s2);

    // 3. 克隆 (Clone)
    let s3 = s2.clone(); // 创建 s2 的深拷贝，s3 获得新所有权
    println!("s2: {}, s3: {}", s2, s3);

    // 4. 函数所有权传递
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被移动到函数内部
    // println!(\"s4: {}\", s4); // 如果取消注释，这行代码会导致编译错误

    // 5. 函数返回值的所有权
    let s5 = gives_ownership(); // 函数返回一个值，所有权被移动给 s5
    println!("s5 (from function): {}", s5);

    let x = 5; // i32 是 Copy 类型，有特殊行为
    let y = x; // x 的值被复制给 y，x 依然有效
    println!("x: {}, y: {}", x, y); // 这两个都可以打印
}

// 这个函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("函数内部接收到: {}", some_string);
} // some_string 在这里离开作用域，其内存被释放 (drop)

// 这个函数创建一个 String 并将其所有权返回
fn gives_ownership() -> String {
    let some_string = String::from("from function");
    some_string // some_string 的所有权被返回给调用者
}
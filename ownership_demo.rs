// Rust所有权概念演示

fn main() {
    // 1. 基本所有权示例
    println!("=== 基本所有权示例 ===");
    {
        let s = String::from("hello"); // s 获得所有权
        println!("s = {}", s);
        // s 离开作用域，其值被丢弃
    } // s 在这里被释放

    // 2. 移动语义示例
    println!("\n=== 移动语义示例 ===");
    {
        let s1 = String::from("hello");
        let s2 = s1; // s1 的值移动到 s2，s1 不再有效
        // println!("{}", s1); // 这行会导致编译错误！
        println!("s2 = {}", s2);
    }

    // 3. 函数所有权示例
    println!("\n=== 函数所有权示例 ===");
    {
        let s = String::from("hello");
        takes_ownership(s); // s 的所有权被移动到函数中
        // println!("{}", s); // 这行会导致编译错误！s 已经不再有效

        let x = 5;
        makes_copy(x); // i32 实现了 Copy trait，所以 x 被复制而不是移动
        println!("x is still valid: {}", x); // 这行可以正常工作
    }

    // 4. 返回值所有权示例
    println!("\n=== 返回值所有权示例 ===");
    {
        let s1 = String::from("hello");
        let s2 = gives_ownership(); // 函数返回所有权
        let s3 = takes_and_gives_back(s1); // 传递所有权然后返回
        println!("s2 = {}, s3 = {}", s2, s3);
    }
}

// 该函数获取所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在这里离开作用域并被释放
}

// 该函数处理 Copy 类型，不会移动所有权
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer 在这里离开作用域，但因为 i32 实现了 Copy，所以不需要释放
}

// 该函数返回所有权
fn gives_ownership() -> String {
    let some_string = String::from("hello from function");
    some_string // 将所有权返回给调用者
}

// 该函数接收所有权并返回所有权
fn takes_and_gives_back(a_string: String) -> String {
    println!("Processing string: {}", a_string);
    a_string // 返回所有权
}
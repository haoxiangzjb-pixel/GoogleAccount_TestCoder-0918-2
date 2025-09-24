// Rust 所有权演示

fn main() {
    // 1. 变量绑定和所有权的获取
    let s1 = String::from("hello"); // s1 绑定到字符串，获得所有权
    println!("s1: {}", s1);

    // 2. 移动语义 (Move Semantics)
    let s2 = s1; // 所有权从 s1 移动到 s2。s1 不再有效。
    // println!("s1: {}", s1); // 如果取消注释，这行代码会报错，因为 s1 已被移动。
    println!("s2: {}", s2);

    // 3. 克隆 (Clone)
    let s3 = s2.clone(); // 创建 s2 的深拷贝，s3 获得新所有权。
    println!("s2: {}", s2); // s2 仍然有效，因为 clone() 创建了新的数据。
    println!("s3: {}", s3); // s3 是一个独立的副本。

    // 4. 函数与所有权
    let s4 = String::from("world");
    takes_ownership(s4); // s4 的所有权被转移给函数 takes_ownership。
    // println!("{}", s4); // 如果取消注释，这行代码会报错，因为 s4 已被移动。

    let x = 5; // i32 是 Copy 类型，不会发生移动。
    makes_copy(x); // x 的值被复制并传递给函数。
    println!("x is still accessible: {}", x); // x 仍然有效。

    // 5. 返回值与所有权
    let s5 = gives_ownership(); // gives_ownership 函数返回一个值，所有权转移给 s5。
    println!("s5 received from function: {}", s5);

    let s6 = String::from("rust");
    let s7 = takes_and_gives_back(s6); // s6 被移动到函数，然后所有权通过返回值移回，赋给 s7。
    println!("s7 received from function: {}", s7);
}

// 这个函数获取 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Function took ownership and printed: {}", some_string);
    // some_string 在这里离开作用域，其内存被释放 (drop)
}

// 这个函数接收一个 Copy 类型 (i32)，所以会发生复制，原变量依然有效。
fn makes_copy(some_integer: i32) {
    println!("Function made a copy and printed: {}", some_integer);
    // some_integer 在这里离开作用域。因为它是 Copy 类型，所以没有特殊操作。
}

// 这个函数创建一个 String 并将其所有权返回给调用者。
fn gives_ownership() -> String {
    let some_string = String::from("yours");
    some_string // some_string 的所有权被返回
}

// 这个函数获取一个 String 的所有权，然后将其返回给调用者。
fn takes_and_gives_back(a_string: String) -> String {
    a_string // a_string 被返回，所有权转移
}
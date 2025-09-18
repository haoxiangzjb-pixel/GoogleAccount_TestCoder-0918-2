fn main() {
    // 1. 栈上的数据拷贝
    let x = 5;
    let y = x; // i32 实现了 Copy trait，这里发生了拷贝
    println!("x = {}, y = {}", x, y); // x 和 y 都可以继续使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy trait，这里发生了移动，s1 不再有效
    // println!("{}", s1); // 这行代码会编译错误，因为 s1 的所有权已经转移给了 s2
    println!("s2 = {}", s2); // 只有 s2 可以使用

    // 3. 克隆 (Deep Copy)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 这里在堆上进行了深拷贝
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以使用

    // 4. 函数调用与所有权
    let s = String::from("hello world");
    takes_ownership(s); // s 的值被移动到函数内部，此处 s 不再有效
    // println!("{}", s); // 这行代码会编译错误

    let x = 5;
    makes_copy(x); // i32 是 Copy 的，此处 x 仍然有效
    println!("x is still valid: {}", x);

    // 5. 函数返回值与所有权
    let s5 = gives_ownership(); // gives_ownership 将返回值的所有权转移给 s5
    println!("s5 owns: {}", s5);

    let s6 = String::from("take and give back");
    let s7 = take_and_give_back(s6); // s6 被移动到函数中，然后函数返回值的所有权转移给 s7
    println!("s7 owns: {}", s7);
    // println!("{}", s6); // 这行代码会编译错误，s6 已被移动
}

fn takes_ownership(some_string: String) {
    println!("Function takes ownership of: {}", some_string);
    // some_string 在这里离开作用域，调用 drop 方法，内存被释放
}

fn makes_copy(some_integer: i32) {
    println!("Function makes a copy of: {}", some_integer);
    // some_integer 在这里离开作用域，但它是一个栈上的值，无需特殊处理
}

fn gives_ownership() -> String {
    let some_string = String::from("I'm given");
    some_string // 返回值将所有权转移给调用方
}

fn take_and_give_back(a_string: String) -> String {
    a_string // 参数的所有权被转移进来，然后又被转移出去
}
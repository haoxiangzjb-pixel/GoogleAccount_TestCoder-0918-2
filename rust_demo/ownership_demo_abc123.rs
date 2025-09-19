fn main() {
    // 1. 栈上的数据拷贝 (Copy)
    let x = 5;
    let y = x; // i32 实现了 Copy trait，所以 x 的值被拷贝给了 y
    println!("x = {}, y = {}", x, y); // x 和 y 都可以继续使用

    // 2. 堆上的数据移动 (Move)
    let s1 = String::from("hello");
    let s2 = s1; // String 没有实现 Copy，这里发生了所有权的转移，s1 不再有效
    // println!("{}", s1); // 这行代码会编译错误，因为 s1 的所有权已经转移给了 s2
    println!("s2 = {}", s2); // 只有 s2 是有效的

    // 3. 克隆 (Clone)
    let s3 = String::from("world");
    let s4 = s3.clone(); // 显式地克隆堆上的数据，s3 和 s4 都拥有自己的数据
    println!("s3 = {}, s4 = {}", s3, s4); // s3 和 s4 都可以继续使用

    // 4. 函数调用与所有权
    let s5 = String::from("rust");
    takes_ownership(s5); // s5 的所有权被移动到函数内部，此处 s5 不再有效
    // println!("{}", s5); // 这行代码会编译错误

    let i = 10;
    makes_copy(i); // i 的值被拷贝到函数内部，此处 i 仍然有效
    println!("i is still valid: {}", i);

    // 5. 函数返回与所有权
    let s6 = gives_ownership(); // 函数返回值的所有权转移给 s6
    println!("s6 = {}", s6);

    let s7 = String::from("take_and_give_back");
    let s8 = takes_and_gives_back(s7); // s7 的所有权移动到函数，函数返回值的所有权再转移给 s8
    // s7 已失效，s8 有效
    println!("s8 = {}", s8);
}

fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在函数结束时被丢弃 (drop)
}

fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer 在函数结束时离开作用域，因为 i32 实现了 Copy，所以是简单拷贝
}

fn gives_ownership() -> String {
    let some_string = String::from("I'm owned by the caller now");
    some_string // 返回值，所有权转移给调用者
}

fn takes_and_gives_back(a_string: String) -> String {
    a_string // 参数的所有权移动进来，然后又作为返回值移动出去
}
fn main() {
    // 创建一个字符串，str1 获取其所有权
    let str1 = String::from("Hello");
    println!("str1: {}, ptr: {:p}", str1, str1.as_ptr());

    // 将 str1 的所有权移动给 str2
    // str1 在此之后不能再使用，否则会编译错误
    let str2 = str1;
    println!("str2: {}, ptr: {:p}", str2, str2.as_ptr());

    // 以下行将导致编译错误，因为 str1 的所有权已被移动
    // println!("str1: {}", str1); // Error!

    // 创建一个整数，i1 获取其所有权（复制类型，不转移）
    let i1 = 42;
    let i2 = i1; // i1 的值被复制给 i2，i1 依然有效
    println!("i1: {}, i2: {}", i1, i2);

    // 函数调用演示所有权转移
    let str3 = String::from("World");
    takes_ownership(str3); // str3 的所有权被转移给函数
    // println!("{}", str3); // Error! str3 在此之后无效

    let i3 = 100;
    makes_copy(i3); // i3 是复制类型，所有权未转移
    println!("i3 after makes_copy: {}", i3); // Ok! i3 依然有效
}

// 此函数获取一个 String 的所有权
fn takes_ownership(some_string: String) {
    println!("Received string: {}", some_string);
    // some_string 在此函数结束时离开作用域，其内存被释放
}

// 此函数获取一个 i32 的值，因为 i32 是复制类型，所以只是复制，不转移所有权
fn makes_copy(some_integer: i32) {
    println!("Received integer: {}", some_integer);
    // some_integer 在此函数结束时离开作用域，因为它是复制类型，所以不发生任何事
}
// Rust所有权概念演示

fn main() {
    // 1. 基本所有权示例
    println!("=== 基本所有权示例 ===");
    {
        let s1 = String::from("hello");  // s1拥有这个字符串
        let s2 = s1;  // s1的所有权转移到s2，s1不再有效
        // println!("{}", s1);  // 这行会报错，因为s1不再有效
        println!("s2 = {}", s2);
    }  // s2在这里离开作用域并被释放

    // 2. 函数所有权转移示例
    println!("\n=== 函数所有权转移示例 ===");
    let s3 = String::from("world");
    let len = calculate_length(s3);  // s3的所有权转移到函数中
    // println!("s3 = {}", s3);  // 这行会报错，因为s3的所有权已经转移
    println!("Length = {}", len);

    // 3. 引用和借用示例
    println!("\n=== 引用和借用示例 ===");
    let s4 = String::from("hello world");
    let len2 = calculate_length_with_reference(&s4);  // 传递引用，不转移所有权
    println!("s4 = {}, Length = {}", s4, len2);  // s4仍然有效

    // 4. 可变引用示例
    println!("\n=== 可变引用示例 ===");
    let mut s5 = String::from("hello");
    println!("Before modification: {}", s5);
    change_string(&mut s5);  // 传递可变引用
    println!("After modification: {}", s5);

    // 5. 避免多个可变引用的示例
    println!("\n=== 避免多个可变引用示例 ===");
    let mut s6 = String::from("hello");
    {
        let r1 = &mut s6;
        println!("r1 = {}", r1);
    }  // r1在这里离开作用域，所以我们可以创建一个新的引用
    let r2 = &mut s6;
    println!("r2 = {}", r2);

    // 6. 悬垂引用避免示例
    println!("\n=== 悬垂引用避免示例 ===");
    let reference_to_nothing = dangle_prevention();
    println!("Returned string: {}", reference_to_nothing);
}

// 函数获取所有权（s被移动到函数中）
fn calculate_length(s: String) -> usize {
    s.len()
    // s在这里离开作用域，String被丢弃
}

// 函数借用引用（不获取所有权）
fn calculate_length_with_reference(s: &String) -> usize {
    s.len()
    // s是引用，不拥有值，所以不释放任何东西
}

// 修改通过可变引用传入的字符串
fn change_string(s: &mut String) {
    s.push_str(", world!");
}

// 返回String而不是引用，避免悬垂引用
fn dangle_prevention() -> String {
    let s = String::from("hello");
    s  // 返回String的所有权
}
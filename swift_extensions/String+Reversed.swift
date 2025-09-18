import Foundation

extension String {
    /// 返回调用字符串的反转版本。
    /// - Returns: 一个新的String实例，其字符顺序与原字符串相反。
    func reversedString() -> String {
        return String(self.reversed())
    }
}

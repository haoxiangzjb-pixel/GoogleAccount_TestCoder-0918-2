import Foundation

extension String {
    /// 返回调用字符串的反转版本。
    /// - Returns: 一个新的 `String` 实例，其字符顺序与原字符串相反。
    func reversed() -> String {
        return String(self.reversed())
    }
}
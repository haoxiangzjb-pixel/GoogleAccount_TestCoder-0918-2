extension String {
    /// Reverses the string in place.
    mutating func reverse() {
        self = String(self.reversed())
    }

    /// Returns a new string with the characters in reverse order.
    /// - Returns: A new reversed string.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// var str = "Hello, world!"
// str.reverse()
// print(str) // Output: !dlrow ,olleH
//
// let originalStr = "Swift"
// let reversedStr = originalStr.reversed()
// print(reversedStr) // Output: tfiwS
// StringExtension.swift

extension String {
    /// Reverses the string and returns a new String instance.
    /// - Returns: A new String with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "hello"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: "olleh"

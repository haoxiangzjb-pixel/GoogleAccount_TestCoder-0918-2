extension String {
    /// Reverses the string and returns a new String instance.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "hello world"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")
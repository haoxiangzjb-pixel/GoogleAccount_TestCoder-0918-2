extension String {
    /// Reverses the string in place.
    mutating func reverse() {
        self = String(self.reversed())
    }

    /// Returns a new string with the characters in reverse order.
    /// - Returns: A new string with the characters reversed.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
var myString = "Hello, world!"
print("Original: $myString)")
myString.reverse()
print("Reversed (in place): $myString)")

let anotherString = "Swift"
let reversedString = anotherString.reversed()
print("Original: $anotherString)")
print("Reversed (new string): $reversedString)")
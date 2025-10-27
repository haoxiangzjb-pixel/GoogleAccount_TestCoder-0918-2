//
//  StringExtension.swift
//  String Extension for Reverse Method
//

import Foundation

extension String {
    /// Reverses the string and returns a new string
    /// - Returns: A new string with characters in reverse order
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = String(self.reversed())
    }
}

// Example usage:
/*
let originalString = "Hello, World!"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")

var mutableString = "Swift"
mutableString.reverse()
print("Mutated reversed: \(mutableString)")
*/
//
//  StringExtension.swift
//  String Extension for Reverse Method
//

import Foundation

extension String {
    /// Reverses the string and returns a new String instance
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place by modifying the original string
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
print("Mutated string: \(mutableString)")
*/
//
//  StringExtension.swift
//  StringExtension
//
//  Created by User on 2023-10-27.
//

import Foundation

extension String {
    /// Reverses the string and returns a new String.
    /// - Returns: A new String with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "hello"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")

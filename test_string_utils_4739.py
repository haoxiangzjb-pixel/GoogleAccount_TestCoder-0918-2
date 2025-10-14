def reverse_string(s):
    """Reverses a given string."""
    return s[::-1]

def test_reverse_string():
    """Test cases for the reverse_string function."""
    assert reverse_string("hello") == "olleh"
    assert reverse_string("") == ""
    assert reverse_string("a") == "a"
    assert reverse_string("12345") == "54321"
    assert reverse_string("racecar") == "racecar"  # Palindrome check
    print("All tests passed!")

if __name__ == "__main__":
    test_reverse_string()
def test_string_reversal():
    assert reversed_string("hello") == "olleh"
    assert reversed_string("") == ""
    assert reversed_string("a") == "a"
    

def reversed_string(s):
    return s[::-1]

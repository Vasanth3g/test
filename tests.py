# test_example.py

import pytest

def add(a, b):
    return a + b

def test_add_simple():
    assert add(2, 3) == 5

@pytest.mark.parametrize("a,b,expected", [
    (1, 1, 2),
    (2, 3, 5),
    (0, 0, 0),
])
def test_add_param(a, b, expected):
    assert add(a, b) == expected

def test_add_type_error():
    with pytest.raises(TypeError):
        add("a", 1)
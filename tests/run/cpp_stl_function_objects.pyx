# mode: run
# tag: cpp, cpp11

from libcpp.functional cimport plus, minus, multiplies, divides, modulus, negate, equal_to, not_equal_to, greater, less
from libcpp.functional cimport greater_equal, less_equal, logical_and, logical_or, logical_not, bit_and, bit_or, bit_xor


def test_arithmetic_operations():
    """
    >>> test_arithmetic_operations()
    """
    # https://github.com/cython/cython/issues/3200
    _plus = plus[int]()
    assert _plus(1, 2) == 3
    _minus = minus[int]()
    assert _minus(3, 2) == 1
    _multiplies = multiplies[int]()
    assert _multiplies(2, 3) == 6
    _divides = divides[int]()
    assert _divides(6, 2) == 3
    _modulus = modulus[int]()
    assert _modulus(3, 2) == 1
    _negate = negate[int]()
    assert _negate(1) == -1


def test_comparisons():
    """
    >>> test_comparisons()
    """
    _equal_to = equal_to[int]()
    assert _equal_to(1, 1)
    assert not _equal_to(1, 2)
    _not_equal_to = not_equal_to[int]()
    assert _not_equal_to(1, 2)
    assert not _not_equal_to(1, 1)
    _greater = greater[int]()
    assert _greater(2, 1)
    assert not _greater(1, 2)
    _less = less[int]()
    assert _less(1, 2)
    assert not _less(2, 1)
    _greater_equal = greater_equal[int]()
    assert _greater_equal(2, 1)
    assert _greater_equal(1, 1)
    assert not _greater_equal(1, 2)
    _less_equal = less_equal[int]()
    assert _less_equal(1, 2)
    assert _less_equal(1, 1)
    assert not _less_equal(2, 1)


def test_logical_operations():
    """
    >>> test_logical_operations()
    """
    _logical_and = logical_and[int]()
    assert _logical_and(True, True)
    assert not _logical_and(True, False)
    _logical_or = logical_or[int]()
    assert _logical_or(True, False)
    assert not _logical_or(False, False)
    _logical_not = logical_not[int]()
    assert _logical_not(False)


def test_bitwise_operations():
    """
    >>> test_bitwise_operations()
    """
    _bit_and = bit_and[int]()
    assert _bit_and(0b1111, 0b0101) == 0b0101
    _bit_or = bit_or[int]()
    assert _bit_or(0b0001, 0b0010) == 0b0011
    _bit_xor = bit_xor[int]()
    assert _bit_xor(0b1010, 0b1100) == 0b0110

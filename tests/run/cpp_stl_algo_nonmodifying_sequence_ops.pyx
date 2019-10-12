# mode: run
# tag: cpp, werror, cpp11

from cython.operator cimport dereference as deref

from libcpp cimport bool
from libcpp.algorithm cimport all_of, any_of, none_of, count, count_if, mismatch, find, find_if, find_if_not
from libcpp.string cimport string
from libcpp.vector cimport vector


cdef bool is_odd(int i):
    return i % 2


def all_odd(vector[int] values):
    """
    Test all_of with is_odd predicate.

    >>> all_odd([3, 5, 7, 11, 13, 17, 19, 23])
    True
    >>> all_odd([3, 4])
    False
    """
    return all_of(values.begin(), values.end(), is_odd)


def any_odd(vector[int] values):
    """
    Test any_of with is_odd predicate.

    >>> any_odd([1, 2, 3, 4])
    True
    >>> any_odd([2, 4, 6, 8])
    False
    """
    return any_of(values.begin(), values.end(), is_odd)


def none_odd(vector[int] values):
    """
    Test none_of with is_odd predicate.

    >>> none_odd([2, 4, 6, 8])
    True
    >>> none_odd([1, 2, 3, 4])
    False
    """
    return none_of(values.begin(), values.end(), is_odd)


def count_ones(vector[int] values):
    """
    Test count.

    >>> count_ones([1, 2, 1, 2])
    2
    """
    return count(values.begin(), values.end(), 1)


def count_odd(vector[int]  values):
    """
    Test count_if with is_odd predicate.

    >>> count_odd([1, 2, 3, 4])
    2
    >>> count_odd([2, 4, 6, 8])
    0
    """
    return count_if(values.begin(), values.end(), is_odd)


def mirror_ends(string data):
    """
    Test mismatch using cppreference example.

    This program determines the longest substring that is simultaneously found at the very beginning of the given string
    and at the very end of it, in reverse order (possibly overlapping).

    >>> mirror_ends(b'abXYZba')
    b'ab'
    >>> mirror_ends(b'abca')
    b'a'
    >>> mirror_ends(b'aba')
    b'aba'
    """
    return string(data.begin(), mismatch(data.begin(), data.end(), data.rbegin()).first)


def mismatch_ints(vector[int] values1, vector[int] values2):
    """
    Test mismatch(first1, last1, first2).

    >>> mismatch_ints([1, 2, 3], [1, 2, 3])
    >>> mismatch_ints([1, 2], [1, 2, 3])
    >>> mismatch_ints([1, 3], [1, 2, 3])
    (3, 2)
    """
    result = mismatch(values1.begin(), values1.end(), values2.begin())
    if result.first == values1.end():
        return
    return deref(result.first), deref(result.second)


def is_int_in(vector[int] values, int target):
    """
    Test find.

    >>> is_int_in(range(5), 3)
    True
    >>> is_int_in(range(5), 10)
    False
    """
    return find(values.begin(), values.end(), target) != values.end()


def find_odd(vector[int] values):
    """
    Test find_if using is_odd predicate.

    >>> find_odd([2, 3, 4])
    3
    >>> find_odd([2, 4, 6])
    """
    result = find_if(values.begin(), values.end(), is_odd)
    if result != values.end():
        return deref(result)
    else:
        return None


def find_even(vector[int] values):
    """
    Test find_if_not using is_odd predicate.

    >>> find_even([3, 4, 5])
    4
    >>> find_even([1, 3, 5])
    """
    result = find_if_not(values.begin(), values.end(), is_odd)
    if result != values.end():
        return deref(result)
    else:
        return None


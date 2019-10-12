from libcpp cimport bool
from libc.stddef import ptrdiff_t


cdef extern from "<algorithm>" namespace "std" nogil:
    # Non-modifying sequence operations
    bool all_of[Iter, Pred](Iter first, Iter last, Pred pred)
    bool any_of[Iter, Pred](Iter first, Iter last, Pred pred)
    bool none_of[Iter, Pred](Iter first, Iter last, Pred pred)

    ptrdiff_t count[Iter, T](Iter first, Iter last, const T& value)
    ptrdiff_t count_if[Iter, Pred](Iter first, Iter last, Pred pred)

    # Modifying sequence operations
    OutputIter copy[InputIter, OutputIter](InputIter, InputIter, OutputIter)

    Iter unique[Iter](Iter first, Iter last)
    Iter unique[Iter, BinaryPredicate](Iter first, Iter last, BinaryPredicate p)

    # Partitioning operations

    # Sorting operations
    void sort[Iter](Iter first, Iter last)
    void sort[Iter, Compare](Iter first, Iter last, Compare comp)

    void partial_sort[Iter](Iter first, Iter middle, Iter last)
    void partial_sort[Iter, Compare](Iter first, Iter middle, Iter last, Compare comp)

    # Binary search operations (on sorted ranges)
    Iter lower_bound[Iter, T](Iter first, Iter last, const T& value)
    Iter lower_bound[Iter, T, Compare](Iter first, Iter last, const T& value, Compare comp)

    Iter upper_bound[Iter, T](Iter first, Iter last, const T& value)
    Iter upper_bound[Iter, T, Compare](Iter first, Iter last, const T& value, Compare comp)

    bool binary_search[Iter, T](Iter first, Iter last, const T& value)
    bool binary_search[Iter, T, Compare](Iter first, Iter last, const T& value, Compare comp)

    # Other operations on sorted ranges

    # Set operations (on sorted ranges)

    # Heap operations
    void make_heap[Iter](Iter first, Iter last)
    void make_heap[Iter, Compare](Iter first, Iter last, Compare comp)

    void push_heap[Iter](Iter first, Iter last)
    void push_heap[Iter, Compare](Iter first, Iter last, Compare comp)

    void pop_heap[Iter](Iter first, Iter last)
    void pop_heap[Iter, Compare](Iter first, Iter last, Compare comp)

    void sort_heap[Iter](Iter first, Iter last)
    void sort_heap[Iter, Compare](Iter first, Iter last, Compare comp)

    # Minimum/maximum operations

    # Comparison operations

    # Permutation operations

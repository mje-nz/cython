from libcpp cimport bool

cdef extern from "<functional>" namespace "std" nogil:
    cdef cppclass function[T]:
        function() except +
        function(T*) except +
        function(function&) except +
        function(void*) except +

        function operator=(T*)
        function operator=(function&)
        function operator=(void*)
        function operator=[U](U)

        bool operator bool()

    # Arithmetic operations
    # Can't deduplicate these due to https://github.com/cython/cython/issues/2759
    # Constructors required due to https://github.com/cython/cython/issues/3193
    cdef cppclass plus[T=*]:
        plus() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass minus[T=*]:
        minus() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass multiplies[T=*]:
        multiplies() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass divides[T=*]:
        divides() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass modulus[T=*]:
        modulus() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass negate[T=*]:
        negate() except +
        T operator()(const T& arg) except +

    # Comparisons
    cdef cppclass equal_to[T=*]:
        equal_to() except +
        bool operator()(const T& lhs, const T& rhs) except +
    cdef cppclass not_equal_to[T=*]:
        not_equal_to() except +
        bool operator()(const T& lhs, const T& rhs) except +
    cdef cppclass greater[T=*]:
        greater() except +
        bool operator()(const T& lhs, const T& rhs) except +
    cdef cppclass less[T=*]:
        less() except +
        bool operator()(const T& lhs, const T& rhs) except +
    cdef cppclass greater_equal[T=*]:
        greater_equal() except +
        bool operator()(const T& lhs, const T& rhs) except +
    cdef cppclass less_equal[T=*]:
        less_equal() except +
        bool operator()(const T& lhs, const T& rhs) except +

    # Logical operations
    cdef cppclass logical_and[T=*]:
        logical_and() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass logical_or[T=*]:
        logical_or() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass logical_not[T=*]:
        logical_not() except +
        T operator()(const T& arg) except +

    # Bitwise operations
    cdef cppclass bit_and[T=*]:
        bit_and() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass bit_or[T=*]:
        bit_or() except +
        T operator()(const T& lhs, const T& rhs) except +
    cdef cppclass bit_xor[T=*]:
        bit_xor() except +
        T operator()(const T& lhs, const T& rhs) except +

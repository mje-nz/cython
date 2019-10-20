from libcpp cimport bool
from libcpp.typeinfo cimport type_info

cdef extern from "<any>" namespace "std" nogil:
    cdef cppclass any:
        any()
        any(const any& other) except +
        # https://github.com/cython/cython/issues/3198
        any any[ValueType](ValueType value) except +  # actually ValueType&&

        any& operator=(const any& rhs) except +
        any& operator=[ValueType](ValueType rhs) except +  # actually ValueType&&

        void reset()
        void swap(any& other)

        bool has_value()
        const type_info& type()

    T any_cast[T](any& operand) except +
    #T* any_cast[T](any* operand)

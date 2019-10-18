from libc.stddef cimport ptrdiff_t
from libcpp cimport bool

cdef extern from "<vector>" namespace "std" nogil:
    cdef cppclass vector[T, Allocator=*]:
        ctypedef T value_type
        ctypedef Allocator allocator_type

        # these should really be allocator_type.size_type and
        # allocator_type.difference_type to be true to the C++ definition
        # but cython doesn't support deferred access on template arguments
        ctypedef size_t size_type
        ctypedef ptrdiff_t difference_type

        cppclass iterator:
            T& operator*()
            iterator operator++()
            iterator operator--()
            iterator operator+(size_type)
            iterator operator-(size_type)
            difference_type operator-(iterator)
            bool operator==(iterator)
            bool operator!=(iterator)
            bool operator<(iterator)
            bool operator>(iterator)
            bool operator<=(iterator)
            bool operator>=(iterator)
        cppclass reverse_iterator:
            T& operator*()
            reverse_iterator operator++()
            reverse_iterator operator--()
            reverse_iterator operator+(size_type)
            reverse_iterator operator-(size_type)
            difference_type operator-(reverse_iterator)
            bool operator==(reverse_iterator)
            bool operator!=(reverse_iterator)
            bool operator<(reverse_iterator)
            bool operator>(reverse_iterator)
            bool operator<=(reverse_iterator)
            bool operator>=(reverse_iterator)
        cppclass const_iterator(iterator):
            pass
        cppclass const_reverse_iterator(reverse_iterator):
            pass

        vector() except +
        # TODO: alloc=*
        vector(size_type, T&) except +
        vector(size_type) except +
        #vector[input_iterator](input_iterator, input_iterator)
        vector(vector&) except +
        #vector& operator=(vector&)
        void assign(size_type, const T&)
        void assign[input_iterator](input_iterator, input_iterator) except +

        # Element access
        T& at(size_type) except +
        T& operator[](size_type)
        T& back()
        T& front()
        T* data()
        const T* const_data "data"()

        # Iterators
        iterator begin()
        const_iterator const_begin "begin"()
        iterator end()
        const_iterator const_end "end"()
        reverse_iterator rbegin()
        const_reverse_iterator const_rbegin "crbegin"()
        reverse_iterator rend()
        const_reverse_iterator const_rend "crend"()

        # Capacity
        bool empty()
        size_type size()
        size_type max_size()
        void reserve(size_type)
        size_type capacity()
        void shrink_to_fit()

        # Modifiers
        void clear()
        iterator insert(iterator, const T&) except +
        iterator insert(iterator, size_type, const T&) except +
        iterator insert[Iter](iterator, Iter, Iter) except +
        iterator erase(iterator)
        iterator erase(iterator, iterator)
        void push_back(T&) except +
        void pop_back()
        void resize(size_type) except +
        void resize(size_type, T&) except +
        void swap(vector&)

        # Non-member functions
        bool operator==(vector&, vector&)
        bool operator!=(vector&, vector&)
        bool operator<(vector&, vector&)
        bool operator<=(vector&, vector&)
        bool operator>(vector&, vector&)
        bool operator>=(vector&, vector&)

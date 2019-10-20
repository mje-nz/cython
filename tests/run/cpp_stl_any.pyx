# mode: run
# tag: cpp, werror, cpp17

from cython.operator cimport dereference as deref

from libcpp cimport bool
from libcpp.any cimport any, any_cast
from libcpp.string cimport string
from libcpp.vector cimport vector

def test_any():
    cdef any a = 1
    print("%s: %s" % (a.type().name(), any_cast[int](a)))
    a = 3.14
    print("%s: %s" % (a.type().name(), any_cast[double](a)))
    a = True
    print("%s: %s" % (a.type().name(), any_cast[bool](a)))

    #     try
    #     {
    #         a = 1;
    #         std::cout << std::any_cast<float>(a) << '\n';
    #     }
    #     catch (const std::bad_any_cast& e)
    #     {
    #         std::cout << e.what() << '\n';
    #     }

    a = 1
    print(any_cast[float](a))


# dicts.pyx

# Import necessary modules
cimport cython
from libc.stdlib cimport malloc, free
import numpy as np
from cpython.pycapsule cimport PyCapsule_Import

# Import necessary pybind11 functionalities
cdef extern from "pybind11/pybind11.h":
    cdef cppclass Dict:
        Dict()  # Constructor
        Dict(object default_value)  # Constructor with default value
        Dict(object default_value)  # Constructor with NumPy array
        object __getitem__(object key_array)
        void __setitem__(object key_array, object value_array)
        void __delitem__(object key_array)
        void iadd(object key_array, object value_array)
        void isub(object key_array, object value_array)
        void ior(object key_array, object value_array)
        void iand(object key_array, object value_array)
        object contains(object key_array)
        size_t __len__()
        object keys()
        object values()
        object items()
        void dump(object filename)
        void load(object filename)

# We wrap Dict functionality into Cython classes
cdef class PyDict:
    cdef Dict *dict  # C++ class instance
    cdef object default_value

    def __cinit__(self, default_value=None):
        self.dict = Dict(default_value)  # Initialize the C++ Dict
        self.default_value = default_value

    def __getitem__(self, key_array):
        return self.dict.__getitem__(key_array)

    def __setitem__(self, key_array, value_array):
        self.dict.__setitem__(key_array, value_array)

    def __delitem__(self, key_array):
        self.dict.__delitem__(key_array)

    def iadd(self, key_array, value_array):
        self.dict.iadd(key_array, value_array)

    def isub(self, key_array, value_array):
        self.dict.isub(key_array, value_array)

    def ior(self, key_array, value_array):
        self.dict.ior(key_array, value_array)

    def iand(self, key_array, value_array):
        self.dict.iand(key_array, value_array)

    def contains(self, key_array):
        return self.dict.contains(key_array)

    def __len__(self):
        return self.dict.__len__()

    def keys(self):
        return self.dict.keys()

    def values(self):
        return self.dict.values()

    def items(self):
        return self.dict.items()

    def dump(self, filename):
        self.dict.dump(filename)

    def load(self, filename):
        self.dict.load(filename)

# Set and MultiDict would follow a similar structure as above.

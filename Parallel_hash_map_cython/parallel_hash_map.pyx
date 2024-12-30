# dicts.pyx

# Import necessary modules
cimport cython
from libc.stdlib cimport malloc, free
import numpy as np
import sys
# sys.path.append(r)
from cpython.pycapsule cimport PyCapsule_Import

# Import necessary pybind11 functionalities
cdef extern from "D:\yjp\OneDrive - zju.edu.cn\Code\ZJU\Study\Python\Parallel_hash_map\Parallel_hash_map_cython\parallel_hashmap\parallel_hashmap\phmap.h":
    cdef cppclass Dict:
        Dict()  # 默认构造函数
        Dict(float default_value)  # 假设 Value 为 float
        Dict(object default_value)  # 假设 Value 为 object
        # cdef object __getitem__(self, object key)
        # cdef void __setitem__(self, object key, object value)
        # cdef void __delitem__(self, object key)
        # cdef size_t __len__(self)
        # cdef object keys(self)
        # cdef object values(self)
        # cdef object items(self)
        # cdef void dump(self, str filename)
        # cdef void load(self, str filename)




# # We wrap Dict functionality into Cython classes
# cdef class PyDict:
#     cdef Dict *dict  # C++ class instance
#     cdef object default_value
#
#     def __cinit__(self, default_value=None):
#         self.dict = Dict(default_value)  # Initialize the C++ Dict
#         self.default_value = default_value
#
#     def __getitem__(self, key_array):
#         return self.dict.__getitem__(key_array)
#
#     def __setitem__(self, key_array, value_array):
#         self.dict.__setitem__(key_array, value_array)
#
#     def __delitem__(self, key_array):
#         self.dict.__delitem__(key_array)
#
#     def iadd(self, key_array, value_array):
#         self.dict.iadd(key_array, value_array)
#
#     def isub(self, key_array, value_array):
#         self.dict.isub(key_array, value_array)
#
#     def ior(self, key_array, value_array):
#         self.dict.ior(key_array, value_array)
#
#     def iand(self, key_array, value_array):
#         self.dict.iand(key_array, value_array)
#
#     def contains(self, key_array):
#         return self.dict.contains(key_array)
#
#     def __len__(self):
#         return self.dict.__len__()
#
#     def keys(self):
#         return self.dict.keys()
#
#     def values(self):
#         return self.dict.values()
#
#     def items(self):
#         return self.dict.items()
#
#     def dump(self, filename):
#         self.dict.dump(filename)
#
#     def load(self, filename):
#         self.dict.load(filename)
#
# # Set and MultiDict would follow a similar structure as above.

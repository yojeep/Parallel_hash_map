import numpy as np
import pyximport
pyximport.install(setup_args={'include_dirs': np.get_include()})
from parallel_hash_map import *
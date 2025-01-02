import numpy as np
import time
a = np.random.randint(0, 2000, 100)
b = a.copy()
import phashmap as ph
d1 = ph.Dict(key_type=a.dtype, value_type=b.dtype)
d1[a]=b
print(d1.contains(a))
t0=time.time()
print(np.all(d1[a]==b))
print(time.time()-t0)
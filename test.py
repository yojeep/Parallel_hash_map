import numpy as np
import time
a = np.random.randint(0, 2000, (10000000,1))
b = a.copy()
import phashmap as ph
d1 = ph.Dict(key_type=a.dtype, value_type=b.dtype,threads=4)
d1[a]=b
t0 = time.time()
for i in range(100):
    print(np.all(d1[a].reshape(-1)==a.reshape(-1)))
print(time.time() - t0)
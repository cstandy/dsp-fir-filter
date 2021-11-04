import numpy as np

BIT_NUM = 8
RAND_SEED = 0
INPUT_SIZE = 8

np.random.seed(0)

c = np.array([1, 2, 3])

# Random integers of [low, high)
x = np.random.randint(
    low=-2**(BIT_NUM-1),
    high=2**(BIT_NUM-1),
    size=(INPUT_SIZE, )
    )
y = np.empty(shape=(INPUT_SIZE-2,), dtype=int)
print(x)

# Print in binary format to apply in voltage bit patterns easier
for i in range(x.size):
    print(np.binary_repr(x[i], width=BIT_NUM))

for i in range(y.size):
    y[i] = np.sum(c * x[i:i+3]).astype(int)

print(y)
for i in range(y.size):
    print(np.binary_repr(y[i], width=2*BIT_NUM))

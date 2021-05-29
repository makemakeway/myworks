import sys
from collections import deque

N = int(sys.stdin.readline().strip())
A = list(map(int, sys.stdin.readline().strip().split()))
NGE = [-1 for all in range(N)]
stack = [0]

i = 1
while stack and i < N:
    while stack and A[stack[-1]] < A[i]:
        NGE[stack[-1]] = A[i]
        stack.pop()

for i in range(N):
    print(NGE[i], end = ' ')
# 크기가 N인 수열 A = A1, A2, ..., AN이 있다. 수열의 각 원소 Ai에 대해서 오큰수 NGE(i)를 구하려고 한다.
# Ai의 오큰수는 오른쪽에 있으면서 Ai보다 큰 수 중에서 가장 왼쪽에 있는 수를 의미한다. 
# 그러한 수가 없는 경우에 오큰수는 -1이다.

# 예를 들어, A = [3, 5, 2, 7]인 경우 NGE(1) = 5, NGE(2) = 7, NGE(3) = 7, NGE(4) = -1이다.
# A = [9, 5, 4, 8]인 경우에는 NGE(1) = -1, NGE(2) = 8, NGE(3) = 8, NGE(4) = -1이다.

import sys
from collections import deque

N = int(sys.stdin.readline().strip())                       #수열의 크기
A = list(map(int, sys.stdin.readline().strip().split()))    #주어지는 수열
NGE = [-1 for all in range(N)]              #오큰수가 없을 때 -1을 출력하기 위해 담아줌
stack = [0]                                 #인덱스를 담아두기 위한 스택

for i in range(1, N):
    while stack and A[stack[-1]] < A[i]:    #stack에는 0이 들어있으므로, A[0]과 A[1]을 비교하는 것과 같음
        NGE[stack.pop()] = A[i]             #A[1]의 값이 더 큰 경우이므로, NGE[0]에 A[1]을 넣어줌
    stack.append(i)                         #다음 값 비교를 위해 스택에 i를 추가해줌

for i in range(N):
    print(NGE[i], end = ' ')
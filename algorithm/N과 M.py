from itertools import permutations

[n, m] = list(map(int, input().split()))




lst = []

for i in range(1, n+1):
    lst.append(i)

answer = (permutations(lst, m))
for a in answer:
    a = map(str, a)
    print(' '.join(a))

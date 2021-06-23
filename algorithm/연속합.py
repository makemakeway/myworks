n = int(input())

arr = list(map(int, input().split()))

stack = [0] * n


stack[0] = arr[0]
for i in range(1, n):
    stack[i] = max(arr[i], arr[i] + stack[i-1])
print(stack)
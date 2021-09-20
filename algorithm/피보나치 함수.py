def fibonacci(n):
    
    if n == 0:
        lst[0] += 1
        return 0
    elif n == 1:
        lst[1] += 1
        return 0
    else:
        return fibonacci(n-1) + fibonacci(n-2)


t = int(input())

for i in range(t):
    lst = [0, 0]
    n = int(input())
    fibonacci(n)
    print(' '.join(map(str,lst)))

# 시간초과

def fibonacci(n):
    i = 0
    a = 0
    b = 1
    c = a + b
    while c < n:
        if n == 0:
            lst[0] += 1
            break
        elif n == 1:
            lst[1] += 1
        else:

    

t = int(input())

for i in range(t):
    lst = [0, 0]
    n = int(input())
    fibonacci(n)
    print(' '.join(map(str,lst)))

# 2 이상의 n이 입력되었을 때, n번째 피보나치 수를 1234567으로 나눈 나머지를 리턴하는 함수, solution을 완성해 주세요.
# n은 1이상, 100000이하인 자연수입니다.

# 재귀로 풀었을 시에, n이 작을 경우는 통과되지만 n이 클 경우에는 런타임에러 및 시간초과 발생

def find_fibo(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    elif n >= 2:
        return find_fibo(n-1) + find_fibo(n-2)

def solution(n):
    answer = 0
    fibo = find_fibo(n)
    answer = fibo % 1234567

    return answer


# for문으로 푸니 통과가능하였음

def find_fibo(n):           #n번째 피보나치 수를 리턴해주는 함수
    fibo = []
    for nbr in range(n+1):  #0부터 n까지의 피보나치를 구하는 반복문
        if nbr == 0:
            fibo.append(0)
        elif nbr == 1:
            fibo.append(1)
        elif nbr >= 2:
            fibo.append((fibo[nbr-1] + fibo[nbr-2]) % 1234567)
    return fibo[-1]

def solution(n):
    fibo = find_fibo(n)
    print(fibo)
    return fibo
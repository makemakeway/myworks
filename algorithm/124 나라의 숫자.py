# 124 나라가 있습니다. 124 나라에서는 10진법이 아닌 다음과 같은 자신들만의 규칙으로 수를 표현합니다.

# 124 나라에는 자연수만 존재합니다.
# 124 나라에는 모든 수를 표현할 때 1, 2, 4만 사용합니다.

# ex)
# 10진법 1 = 124 나라 1
# 10진법 2 = 124 나라 2
# 10진법 3 = 124 나라 4
# 10진법 4 = 124 나라 11
# 10진법 5 = 124 나라 12
# 10진법 6 = 124 나라 14
# 10진법 7 = 124 나라 21
# 10진법 8 = 124 나라 22
# 10진법 9 = 124 나라 24
# 10진법 10 = 124 나라 41

# 자연수 n이 매개변수로 주어질 때, n을 124 나라에서 사용하는 숫자로 바꾼 값을 return 하도록 solution 함수를 완성해 주세요.


# 재귀로 풀어보려 했으나, 런타임 에러로 인해 실패
def convert(nbr, base):
    b = "412"
    q, r = divmod(nbr, base)
    if r == 0:
        q -= 1
        return convert(q, base) + b[r]
    elif q == 0:
        return b[r]   
    else:
        return convert(q, base) + b[r]



# while문을 이용하여 풀 수 있었음
def solution(n):
    answer = ''
    base = '412'                    
    
    while n:
        n, r = divmod(n, 3)
        answer = base[r] + answer
        if r == 0:      # n이 3의 배수일 때, 1을 빼주지 않으면 while문을 한번 더 돌아 오류 발생
            n -= 1      # 1을 빼서 n == 0을 만들어 while문을 빠져나올 수 있도록 함
    return answer
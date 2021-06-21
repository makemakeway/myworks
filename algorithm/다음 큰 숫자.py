# 자연수 n이 주어졌을 때, n의 다음 큰 숫자는 다음과 같이 정의 합니다.

# 조건 1. n의 다음 큰 숫자는 n보다 큰 자연수 입니다.
# 조건 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
# 조건 3. n의 다음 큰 숫자는 조건 1, 2를 만족하는 수 중 가장 작은 수 입니다.
# 예를 들어서 78(1001110)의 다음 큰 숫자는 83(1010011)입니다.

# 자연수 n이 매개변수로 주어질 때, n의 다음 큰 숫자를 return 하는 solution 함수를 완성해주세요.

def convert(n, b):                  # 2진수 변환을 위한 함수
    base = "01"
    q, r = divmod(n, b)
    if q == 0:
        return base[r]
    else:
        return convert(q, b) + base[r]
    
    
def solution(n):
    answer = 0
    one = str(convert(n, 2)).count("1")         # 2진수로 변환 후, 1의 갯수를 세서 저장
    while True:
        n += 1                                  # n을 1씩 증가시키면서
        next_one = str(convert(n, 2)).count("1")# 2진수로 변환 후, 1의 갯수 저장
        if one == next_one:                     # 1의 갯수 비교 후 같으면 리턴
            return n
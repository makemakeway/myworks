# 한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 
# 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.

# 각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 
# 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

# 제한사항
# numbers는 길이 1 이상 7 이하인 문자열입니다.
# numbers는 0~9까지 숫자만으로 이루어져 있습니다.
# "013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.
# 입출력 예
# numbers	return
# "17"	        3
# "011"	        2

from itertools import permutations  # 모든 경우의 수를 찾기 위해 순열 사용

def is_prime(num):
    if num < 2:
            return False
    for n in range(2, (int(num**0.5) + 1)): # 2부터 제곱근까지 나눠떨어지는 수가 있다면, 소수 x
        if num % n == 0:
            return False
    return True

def solution(numbers):
    comb = []
    lst = []
    for n in range(1, len(numbers)+1):
        comb += permutations(numbers, n)    #1개부터 len(numbers)만큼 모든 경우의 수를 comb에 저장
    for s in set(comb):                     #1차적으로 중복되는 리스트를 set을 이용하여 제거
        num = int(''.join(s))               
        if is_prime(num) and num not in lst:    #요소들을 int형으로 바꾸면서 소수인지, 중복된 수인지 확인
            lst.append(num)                     #소수이면서 중복된 수가 아니라면, lst에 저장
    return len(lst)
from itertools import combinations

def is_prime(nbr): #nbr = 정수로 이루어진 리스트
    for i in range(2, int(nbr ** 0.5) + 1): # 2부터 제곱근까지 순회
        if nbr % i == 0: # 나눠 떨어지는 수가 있다면 소수 x
            return False
    return True

def solution(nums):
    
    count = 0
    cmb = list(combinations(nums, 3)) #nums중 3가지를 뽑는 조합을 리스트형식으로 저장
    for set in cmb:
        set_sum = sum(set) #한 리스트의 합을 set_sum 변수에 저장
        if is_prime(set_sum): #set_sum이 소수일 경우
            count += 1
    answer = count
    return answer
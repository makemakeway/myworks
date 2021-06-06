
# 길이가 같은 배열 A, B 두개가 있습니다. 각 배열은 자연수로 이루어져 있습니다.
# 배열 A, B에서 각각 한 개의 숫자를 뽑아 두 수를 곱합니다. 이러한 과정을 배열의 길이만큼 반복하며, 
# 두 수를 곱한 값을 누적하여 더합니다. 이때 최종적으로 누적된 값이 최소가 되도록 만드는 것이 목표입니다. 
# (단, 각 배열에서 k번째 숫자를 뽑았다면 다음에 k번째 숫자는 다시 뽑을 수 없습니다.)


# 길이가 같은 두 배열의 원소를 곱하고, 곱한 결과를 더한 뒤 그 최솟값을 찾는 문제
# 단순히 A배열은 오름차순 순서로 정렬, B배열은 내림차순 순서로 정렬한 뒤,
# 각 배열의 같은 인덱스의 원소끼리 곱하고, 그 합을 저장하면 최솟값이 될 것이라고 생각하였음

def solution(A,B):
    answer = 0
    A = sorted(A)                   #A를 오름차순 정렬
    B = sorted(B, reverse=True)     #B를 내림차순 정렬
    i = 0
    sumlist = [0]
    for sum in A:
        sumlist[0] += (A*B[i])      #A의 원소와 B의 원소를 곱한뒤, sumlist에 더해줌
        i += 1
    return sumlist[0]

# 최종 제출본
def solution(A,B):
    answer = 0
    A = sorted(A)
    B = sorted(B, reverse=True)
    sumlist = [0]
    for AB in list(zip(A, B)):
        sumlist[0] += (AB[0] * AB[1])
    return sumlist[0]
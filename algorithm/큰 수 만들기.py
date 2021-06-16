# 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.

# 예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.

# 문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다.

# number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.

from itertools import combinations

def solution(number, k):
    comb = list(combinations(list(number), len(number) - k)) # number 문자열에서 k개의 문자를 뺀 경우들을 list형식으로 저장
    return ''.join(max(comb)) # 그 중 가장 큰것을 str형식으로 반환

# 위 코드는 시간초과로 인해 실패함

def solution(number, k):
    stack = [number[0]]     # stack에 첫값을 넣고
    for n in number[1:]:    # 그 다음 값부터 순회
        while len(stack) > 0 and stack[-1] < n and k > 0:   # stack에 값이 있고, stack의 끝 값보다 크고, 지워야 하는 수가 있을 때
            k -= 1          # k에 1을 빼고
            stack.pop()     # stack의 끝 값을 꺼냄
        stack.append(n) 

    if k != 0:              # 제일 큰 값을 찾았는데, k가 남아있는 경우
        stack = stack[:-k]  # 완성된 수에서 k자리만큼을 빼줌 ex)[1, 0, 0, 0, 0] -> [1, 0, 0]
    return ''.join(stack)
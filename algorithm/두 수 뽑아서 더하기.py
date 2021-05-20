from itertools import combinations
def solution(numbers): #numbers = 정수로ㅗ 이루어진 리스트
    answer = []
    sum_nbrs = list(combinations(numbers, 2)) # numbers에서 2가지를 선택하는 경우를 sum_nbrs에 리스트 형식으로 저장
    for sums in sum_nbrs: # 순회하면서 합을 answer에 넘겨줌
        answer.append(sum(sums))
    answer = sorted(list(set(answer))) # set형식으로 중복값 제거 후 list형식으로 캐스팅 한 뒤 sorted로 오름차순 정렬
    return answer
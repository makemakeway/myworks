def solution(array, commands): #array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수
                               #i = commands[0] j = commands[1] k = commands[2]
    answer = []
    for nbrs in commands: # 2차원 배열 형태의 commands를 순환 ex) [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
        tmp_list = [] #배열 초기화
        tmp_list = sorted(tmp_list + array[nbrs[0]-1:nbrs[1]]) #i번째 숫자부터 j번째 숫자까지 자르고 정렬
        answer.append(tmp_list[nbrs[2]-1]) #k번째에 있는 수 answer에 삽입
    return answer
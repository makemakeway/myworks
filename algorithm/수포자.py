def solution(answers):
    answer = []
    st_pick = [1, 2, 3, 4, 5] # 1번 수포자의 찍는 방식
    nd_pick = [2, 1, 2, 3, 2, 4, 2, 5] # 2번 수포자의 찍는 방식
    rd_pick = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] # 3번 수포자의 찍는 방식
    count = [0, 0, 0] # n번인덱스 -> n+1번 수포자의 정답 갯수
    index = 0
    
    for i in answers:
        if st_pick[index % 5] == i: # 0~4번 인덱스를 돌리면서, answers의 정답과 비교
            count[0] += 1 #elif로 처리하지 않은 이유는 세가지 케이스를 모두 비교해야 하기 때문
        if nd_pick[index % 8] == i: # 0~7번 인덱스를 돌리면서, answers의 정답과 비교
            count[1] += 1
        if rd_pick[index % 10] == i: # 0~9번 인덱스를 돌리면서, answers의 정답과 비교
            count[2] += 1
        index += 1
        
    for i in range(3):
        if max(count) == count[i]: # 제일 많이 맞은 사람의 정답 갯수와 i+1번 수포자의 정답 갯수 비교
            answer.append(i + 1)
    return answer
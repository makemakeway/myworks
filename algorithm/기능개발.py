#먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와
#각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 
#각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.

def solution(progresses, speeds):
    stack = []
    day = 1
    count = 0 # 0번째 인덱스의 작업량이 100이상을 채웠을 때, 
    while len(progresses) != 0: #progresses와 speeds의 맨 앞 값을 보고 합이 100 이상이면 pop으로 뽑을 것이기 때문에, progreese의 길이가 0이 될때까지로 반복문을 수행
        if (progresses[0] + speeds[0] * day) >= 100: #day마다 speeds의 양이 증가. 작업량이 100 이상에 도달했을 때의 조건
            progresses.pop(0)
            speeds.pop(0)
            count += 1 # 작업이 완료된 갯수를 세줌
        else:
            if count != 0: #카운트가 올라갔다는것은 작업이 완료된 것이 있다는 뜻이므로, 작업량을 리스트에 넣어주고 초기화시켜줌
                stack.append(count)
                count = 0
            day += 1 #작업이 완료된 것이 없으므로 day를 하나 증가시켜줌
    stack.append(count) #마지막에 추가된 count는 조건문에 걸리지 않아 반복문이 끝나고 추가시켜줌
    return stack
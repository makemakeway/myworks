from collections import deque

def solution(priorities, location):
    copy = deque(priorities)    # 스택을 효율적으로 사용하기 위해 deque 사용
    count = 0
    while copy:                     # copy에 값이 있을 경우
        if location == 0:           # location의 값이 0일 때 더 큰값이 있는지 확인
            if copy[0] < max(copy): 
                copy.append(copy.popleft()) # 더 큰 값이 있는 경우, 맨 앞에 있는 숫자를 뒤로 보냄
                location = len(copy) - 1    # location 초기화
            else:
                return count + 1            # 더 큰 값이 없는 경우, 몇번째로 출력되었는지 count를 리턴하면서 종료
        else:   #location보다 앞에 있는 숫자들을 처리하는 과정
            if copy[0] < max(copy):
                copy.append(copy.popleft())
                location -= 1
            else:
                copy.popleft()  # 최대값일경우, 출력해야하므로 popleft를 이용하여 꺼냄
                location -= 1   # 하나를 출력했으므로, location을 줄여줌
                count += 1      # 출력한 갯수를 더해줌
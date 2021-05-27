# 정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.

# 명령은 총 여섯 가지이다.

# push X: 정수 X를 큐에 넣는 연산이다.
# pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# size: 큐에 들어있는 정수의 개수를 출력한다.
# empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
# front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.


import sys

que = []
n = int(sys.stdin.readline()) # 명령의 수를 입력받음

for i in range(n): # n번의 반복문 실행
    command = sys.stdin.readline().strip().split() # 명령을 입력받음
    if command[0] == 'push': # command의 첫번째 인자가 push일때
        que.append(command[1]) # command의 두번째 인자를 que에 추가
    elif command[0] == 'pop':
        if que != []: print(que.pop(0)) # que가 비어있지 않다면, 가장 맨처음에 받은 인자를 출력함 (FIFO)
        else : print(-1) # 비어있다면, -1출력
    elif command[0] == 'size':
        print(len(que))
    elif command[0] == 'empty':
        if que == []: print(1)
        else : print(0)
    elif command[0] == 'front':
        if que == []: print(-1)
        else : print(que[0]) # que의 가장 앞에 있는 정수 출력
    elif command[0] == 'back':
        if que == []: print(-1)
        else : print(que[-1]) # que의 가장 뒤에 있는 정수 출력

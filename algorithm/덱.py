# 정수를 저장하는 덱(Deque)를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.

# 명령은 총 여덟 가지이다.

# push_front X: 정수 X를 덱의 앞에 넣는다.
# push_back X: 정수 X를 덱의 뒤에 넣는다.
# pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# size: 덱에 들어있는 정수의 개수를 출력한다.
# empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
# front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
# back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.

import sys
from collections import deque

N = int(sys.stdin.readline().strip()) #명령의 수
deq = deque() #deque는 양방향 큐 형식으로, 양 끝에서의 append와 pop이 압도적으로 빠르다.


for i in range(N): #명령의 수만큼 반복
    command = sys.stdin.readline().strip().split() #명령어 입력
    if command[0] == 'push_front': #명령어의 첫번째 인자 비교
        deq.appendleft(command[1]) #->방향으로 추가
    elif command[0] == 'push_back':
        deq.append(command[1]) #<-방향으로 추가
    elif command[0] == 'pop_front':
        if deq != deque([]): print(deq.popleft()) #deq가 비어있지 않을 경우
        else: print(-1)
    elif command[0] == 'pop_back':
        if deq != deque([]): print(deq.pop())
        else: print(-1)
    elif command[0] == 'size':
        print(len(deq))
    elif command[0] == 'empty':
        if deq != deque([]): print(0)
        else: print(1)
    elif command[0] == 'front':
        if deq != deque([]): print(deq[0])
        else: print(-1)
    elif command[0] == 'back':
        if deq != deque([]): print(deq[-1])
        else: print(-1)

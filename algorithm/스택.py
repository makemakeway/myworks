#push X: 정수 X를 스택에 넣는 연산이다.
#pop: 스택에서 가장 위에 있는 정수를 빼고, 그 수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
#size: 스택에 들어있는 정수의 개수를 출력한다.
#empty: 스택이 비어있으면 1, 아니면 0을 출력한다.
#top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.

#첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 10,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.

#출력해야하는 명령이 주어질 때마다, 한 줄에 하나씩 출력한다.

import sys # 빠른 입력을 위해 sys 사용

stack = []
leng = int(sys.stdin.readline()) #주어지는 명령의 갯수
for i in range(leng): #명령 갯수만큼 반복
    command = sys.stdin.readline().split() #명령어를 입력
    if command[0] == 'push':
        stack.append(int(command[1])) #push 다음 숫자가 split으로 나눠졌으므로, 다음 인덱스를 append해줌
    elif command[0] == 'pop':
        if len(stack) == 0: #stack이 비어있다면
            print(-1) #-1 출력
        else:
            print(stack.pop())
    elif command[0] == 'size':
        print(len(stack))
    elif command[0] == 'empty':
        if len(stack) != 0:
            print(0)
        else:
            print(1)
    elif command[0] == 'top':
        if len(stack) == 0:
            print(-1)
        else:
            print(stack[-1])
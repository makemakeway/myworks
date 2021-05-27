# 문자열 S가 주어졌을 때, 이 문자열에서 단어만 뒤집으려고 한다.

# 먼저, 문자열 S는 아래와과 같은 규칙을 지킨다.

# 알파벳 소문자('a'-'z'), 숫자('0'-'9'), 공백(' '), 특수 문자('<', '>')로만 이루어져 있다.
# 문자열의 시작과 끝은 공백이 아니다.
# '<'와 '>'가 문자열에 있는 경우 번갈아가면서 등장하며, '<'이 먼저 등장한다. 또, 두 문자의 개수는 같다.
# 태그는 '<'로 시작해서 '>'로 끝나는 길이가 3 이상인 부분 문자열이고, '<'와 '>' 사이에는 알파벳 소문자와 공백만 있다.
# 단어는 알파벳 소문자와 숫자로 이루어진 부분 문자열이고, 연속하는 두 단어는 공백 하나로 구분한다.
# 태그는 단어가 아니며, 태그와 단어 사이에는 공백이 없다.

import sys
from collections import deque

S = list(sys.stdin.readline().strip())
que = deque()
stack = []      # 태그 안에 있는건 que를 이용해서 그대로 출력, 태그 외에 있는 것은 stack으로 거꾸로 출력하기 위해 que, stack 사용
answer = ''
flag = True     # 괄호가 완성되었는지 확인하는 flag. True는 완성, False는 미완성

for i in S:
    if i == '<':
        flag = False                    # 태그가 완성되지 않았으므로 False로 플래그를 내림
        while stack != []:              # '<' 전까지 쌓여있는 스택을 완전히 비울때까지 answer에 넣어줌
            answer += stack.pop()
        que.append(i)                   # 태그는 정방향으로 출력해야하므로 que에 append해줌
    elif i == '>':
        if flag == False:               # 태그가 미완성 상태에서 '>'를 만날경우
            flag = True                 # 태그를 완성했으니 flag를 세워줌
            que.append(i)               # '>'를 que에 append해줌. que 안의 상태는 [<something>]으로 예상할 수 있음.
            while que != deque([]):     # que를 정방향으로 꺼내면서 answer에 넣어줌
                answer += que.popleft()
    elif i == ' ':
        if flag == True:                # 태그가 완성되어 있는 상태(태그 바깥)에서 공백을 만날 경우
            while stack != []:
                answer += stack.pop()   # 태그 바깥의 문자이므로, stack에 있는 문자들을 거꾸로 넣어줌
            answer += ' '               # 공백 추가
        else:                           # 태그 안쪽에 있는 공백을 만날 경우이므로, que에 있는 문자를 정뱡향으로 넣어줌
            while que != deque([]):
                answer += que.popleft()
            answer += ' '
    else:
        if flag == True:                # 일반 문자를 태그 바깥에서 만난 경우
            stack.append(i)             # 스택에 추가
        else:
            que.append(i)               # 큐에 추가
    
# 혹시라도 남아있는 것이 있으면, answer에 추가해줌
while stack != []:
    answer += stack.pop()
while que != deque([]):
    answer += que.popleft()

print(answer)
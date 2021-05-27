# 한 줄로 된 간단한 에디터를 구현하려고 한다. 이 편집기는 영어 소문자만을 기록할 수 있는 편집기로, 
# 최대 600,000글자까지 입력할 수 있다.

# 이 편집기에는 '커서'라는 것이 있는데, 커서는 문장의 맨 앞(첫 번째 문자의 왼쪽), 
# 문장의 맨 뒤(마지막 문자의 오른쪽), 또는 문장 중간 임의의 곳(모든 연속된 두 문자 사이)에 위치할 수 있다.
# 즉 길이가 L인 문자열이 현재 편집기에 입력되어 있으면, 커서가 위치할 수 있는 곳은 L+1가지 경우가 있다.

# 이 편집기가 지원하는 명령어는 다음과 같다.

# L	커서를 왼쪽으로 한 칸 옮김 (커서가 문장의 맨 앞이면 무시됨)
# D	커서를 오른쪽으로 한 칸 옮김 (커서가 문장의 맨 뒤이면 무시됨)
# B	커서 왼쪽에 있는 문자를 삭제함 (커서가 문장의 맨 앞이면 무시됨)
# 삭제로 인해 커서는 한 칸 왼쪽으로 이동한 것처럼 나타나지만, 실제로 커서의 오른쪽에 있던 문자는 그대로임
# P $	$라는 문자를 커서 왼쪽에 추가함

# 초기에 편집기에 입력되어 있는 문자열이 주어지고, 그 이후 입력한 명령어가 차례로 주어졌을 때,
# 모든 명령어를 수행하고 난 후 편집기에 입력되어 있는 문자열을 구하는 프로그램을 작성하시오.
# 단, 명령어가 수행되기 전에 커서는 문장의 맨 뒤에 위치하고 있다고 한다.

import sys

str = sys.stdin.readline().strip() #주어지는 문자열 저장
n = int(sys.stdin.readline()) #명령어의 개수 저장
cursor = len(str) #기본 커서의 위치는 문자열의 맨뒤
for i in range(n): #명령어의 개수만큼 반복문 실행
    command = list(sys.stdin.readline().strip().split()) #명령어를 리스트 형식으로 저장
    if command[0] == 'P': #명령어의 첫번째 인자가 P일 경우
        str = str[0:cursor] + command[1] + str[cursor:] #현재 커서가 있는곳 왼쪽에 명령어의 두번째 인자를 추가해줌
        if cursor < len(str) : cursor += 1 #커서가 최대값이 아닌 경우, 커서값을 1 올려줌 
    elif command[0] == 'L': #명령어의 첫번째 인자가 L일 경우
        if cursor > 0 : cursor -= 1 #커서가 왼쪽으로 이동하는 경우이므로, 커서값이 최소값이 아닐 때 커서값을 -1 해줌
    elif command[0] == 'D':
        if cursor < len(str) : cursor += 1
    elif command[0] == 'B':
        if cursor > 0 : #커서가 최소값이면 지울 것이 없으므로 0보다 커야함
            str = str[0:cursor - 1] + str[cursor:] 
            cursor -= 1
print(str)

# 위 코드로는 시간초과 문제로 실패함

import sys

str = list(sys.stdin.readline().strip()) #주어지는 문자열 저장
n = int(sys.stdin.readline()) #명령어의 개수 저장
stack = []
for i in range(n): #명령어의 개수만큼 반복문 실행
    command = list(sys.stdin.readline().strip().split()) #명령어를 리스트 형식으로 저장
    if command[0] == 'P': #명령어의 첫번째 인자가 P일 경우
        str.append(command[1]) #str 리스트에 명령어의 두번째 인자를 append해줌
    elif command[0] == 'L' and str != []: #명령어의 첫번째 인자가 L일 경우
        stack.append(str.pop()) #커서가 왼쪽으로 갔으므로, str의 맨 마지막 인자를 stack 리스트에 추가
    elif command[0] == 'D' and stack != []:
        str.append(stack.pop()) #커서가 오른쪽으로 갔으므로, stack의 인자를 str으로 추가
    elif command[0] == 'B' and str != []:
        str.pop()
print(''.join(str) + ''.join(reversed(stack))) 
# 리스트 원소들을 join함수로 합쳐서 출력
# stack에는 원소들이 stack형식으로 쌓여있으므로, reversed로 거꾸로 출력

#append()와 pop()은 O(1)의 시간복잡도를 가져서 통과할 수 있었음.
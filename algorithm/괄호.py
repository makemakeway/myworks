#괄호 문자열(Parenthesis String, PS)은 두 개의 괄호 기호인 ‘(’ 와 ‘)’ 만으로 구성되어 있는 문자열이다.
#그 중에서 괄호의 모양이 바르게 구성된 문자열을 올바른 괄호 문자열(Valid PS, VPS)이라고 부른다.
#한 쌍의 괄호 기호로 된 “( )” 문자열은 기본 VPS 이라고 부른다.
#만일 x 가 VPS 라면 이것을 하나의 괄호에 넣은 새로운 문자열 “(x)”도 VPS 가 된다.
#그리고 두 VPS x 와 y를 접합(concatenation)시킨 새로운 문자열 xy도 VPS 가 된다.
#예를 들어 “(())()”와 “((()))” 는 VPS 이지만 “(()(”, “(())()))” ,
#그리고 “(()” 는 모두 VPS 가 아닌 문자열이다. 

#여러분은 입력으로 주어진 괄호 문자열이 VPS 인지 아닌지를 판단해서 그 결과를 YES 와 NO 로 나타내어야 한다.
#입력 데이터는 표준 입력을 사용한다. 입력은 T개의 테스트 데이터로 주어진다. 입력의 첫 번째 줄에는 입력 데이터의 수를 나타내는 정수 T가 주어진다. 각 테스트 데이터의 첫째 줄에는 괄호 문자열이 한 줄에 주어진다. 하나의 괄호 문자열의 길이는 2 이상 50 이하이다.
#출력은 표준 출력을 사용한다. 만일 입력 괄호 문자열이 올바른 괄호 문자열(VPS)이면 “YES”, 아니면 “NO”를 한 줄에 하나씩 차례대로 출력해야 한다. 

data_cnt = int(input()) #입력받을 데이터의 갯수
data = []
result = []
for i in range(data_cnt):
    data.append(input())
    if data[i].count('(') == data[i].count(')'): #갯수가 같고
        if data[0] == '(' and data[-1] == ')': #'('로 시작해서 ')'로 끝나면 vps형식
            result.append('YES') #결과 리스트에 YES 담아둠
        else:
            result.append('NO')
    else:
        result.append('NO') #결과 리스트에 NO 담아둠
for answer in result: #결과 출력부
    print(answer)
#실패한 코드. 갯수가 같아도 올바른 VPS형식이 아닌 예시가 있었다. ex) "())(()"

#갯수가 같고, 짝이 맞아야한다 ex) "()"은 가능, ")("은 불가능
#다시 작성한 코드.
data_cnt = int(input())

def is_vps(data):
    stack = []
    for i in data:
        if i == '(':
            stack.append(i)
        else:
            if len(stack) == 0: # ')'를 받았는데 스택에 '('가 없으면 짝이 없다는 것이므로 vps가 아니다.
                print('NO')
                return
            else:
                stack.pop()
    if len(stack) == 0: #스택이 비어있지 않으면, 갯수가 맞지 않다는 것이므로 vps가 아니다.
        print('YES')
        return
    else:
        print('NO')
        return

for i in range(data_cnt):
    data = input()
    is_vps(data)
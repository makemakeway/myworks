# 문제 설명
# 주어진 항공권을 모두 이용하여 여행경로를 짜려고 합니다. 
# 항상 "ICN" 공항에서 출발합니다.

# 항공권 정보가 담긴 2차원 배열 tickets가 매개변수로 주어질 때, 
# 방문하는 공항 경로를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

# 제한사항
# 모든 공항은 알파벳 대문자 3글자로 이루어집니다.
# 주어진 공항 수는 3개 이상 10,000개 이하입니다.
# tickets의 각 행 [a, b]는 a 공항에서 b 공항으로 가는 항공권이 있다는 의미입니다.
# 주어진 항공권은 모두 사용해야 합니다.
# 만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return 합니다.
# 모든 도시를 방문할 수 없는 경우는 주어지지 않습니다.

def solution(tickets):
    answer = []
    stack = ["ICN"]
    route = {}
    for t in tickets:               # 티켓들을 딕셔너리 형태로 생성
        if t[0] in route:
            route[t[0]].append(t[1])
        else:
            route[t[0]] = [t[1]]
    
    for key in route.keys():        # 스택을 이용할 것이므로, 밸류값들을 내림차순으로 정렬
        route[key].sort(reverse=True)
    
    
    while stack:
        start = stack[-1]
        
        if start not in route or len(route[start]) == 0:    # route 딕셔너리에 출발지에 대응하는 값이 없을 때
            answer.append(stack.pop())
        else:
            stack.append(route[start].pop())                # 있다면, 그 값을 스택에 추가함
        
    return answer[::-1]
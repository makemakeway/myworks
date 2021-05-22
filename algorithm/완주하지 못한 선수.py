# 마라톤에 참여한 선수들의 이름이 담긴 배열 participant와
# 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때,
# 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.

def solution(participant, completion):
    answer = ''
    for name in participant:
        if participant.count(name) != completion.count(name): # 참여자와 완주자에 있는 이름 갯수가 같은지 비교
            answer = name # 이름 갯수가 같지 않다면, 완주하지 못했다는 것이므로 answer 리턴
    return answer
# 위 코드는 시간초과

def solution(participant, completion):
    answer = ''
    if participant.count(participant[0]) != completion.count(participant[0]):
        answer = participant[0] 
        return answer
    else: #비교한 값들을 지우는 과정
        completion.remove(participant[0]) 
        del participant[0]
    return solution(participant, completion) #값을 지우고 다시 호출
# 재귀로 풀었으나 런타임 에러


def solution(participant, completion):
    participant.sort() # 같은 인덱스를 비교할 수 있도록 sort로 정렬
    completion.sort()
    for i in range(len(completion)): # completion의 갯수만큼 순회
        if participant[i] != completion[i]: # 정렬되어 있으므로, 같은 인덱스의 값이 다르면
            return participant[i] # 그 인덱스의 참가자 리턴
    return participant.pop()
# 통과한 함수